import Foundation
import CoreMotion
import UIKit

protocol MainDelegate: class {
    func changeCatImage(catNumber: String)
    func talkingWithCat(eventNumber: Int, catNumber: String)
}

class StepCountClass {
    weak var delegate: MainDelegate?
    // 歩数管理ライブラリ
    var pedometer: CMPedometer!
    // 一回の散歩での最大数記録
    var maxStepCount: Int
    // 累計歩数
    var totalStepCount: Int = 0
    // 現在連れてる猫番号
    var nowCatNumber: String = ""
    // UserDefault管理クラス
    let userDefaultUtil = UserDefaultUtil()
    // その散歩における歩数
    var sanpoStepCount: Int = 0
    // その猫を連れて歩いた歩数
    var nowCatStep: Int = 0
    // 猫が最後に代わった時点の歩数
    var catChangeTimeStep: Int = 0
    // 前回猫ごとの歩数をカウントする為に渡した歩数
    var prevCatStep: Int = 0
    // 他のモーダルを開いてるかどうか管理するフラグ
    static var isOpenOtherModal: Bool = false
    
    init() {
        maxStepCount = 0
        totalStepCount = userDefaultUtil.readTotalSanpStepCount()
        pedometer = CMPedometer()
        nowCatNumber = userDefaultUtil.readNowCatNumber()
    }

    // 猫ごとの歩数カウント開始
    func startCatStepCount(catChangeTimeStep: Int, sanpoStepCount: Int) {
        self.nowCatStep = self.userDefaultUtil.readCatStep(catNumber: self.nowCatNumber)
        // 現在連れている猫の歩数を加算
        if (self.nowCatNumber != "") {
            self.userDefaultUtil.saveCatStep(stepCount: self.nowCatStep + sanpoStepCount - catChangeTimeStep - prevCatStep, catNumber: self.nowCatNumber)
            // 猫ごとの歩数が一定数以上になるとイベント発生
            if (!StepCountClass.isOpenOtherModal) {
                if (Int(CAT_EVENT_STEP) / 3 < self.nowCatStep) {
                    if (!userDefaultUtil.readCatEventFlag(catNumber: self.nowCatNumber, eventNumber: 0)) {
                        delegate?.talkingWithCat(eventNumber: 0, catNumber: self.nowCatNumber)
                        userDefaultUtil.saveCatEventFlag(catNumber: self.nowCatNumber, eventNumber: 0)
                    }
                }
                if ((Int(CAT_EVENT_STEP) / 3) * 2 < self.nowCatStep) {
                    if (!userDefaultUtil.readCatEventFlag(catNumber: self.nowCatNumber, eventNumber: 1)) {
                        delegate?.talkingWithCat(eventNumber: 1, catNumber: self.nowCatNumber)
                        userDefaultUtil.saveCatEventFlag(catNumber: self.nowCatNumber, eventNumber: 1)
                    }
                }
                if (self.nowCatStep > Int(CAT_EVENT_STEP)) {
                    if (!userDefaultUtil.readCatEventFlag(catNumber: self.nowCatNumber, eventNumber: 2)) {
                        delegate?.talkingWithCat(eventNumber: 2, catNumber: self.nowCatNumber)
                        userDefaultUtil.saveCatEventFlag(catNumber: self.nowCatNumber, eventNumber: 2)
                    }
                }
            }
            prevCatStep = sanpoStepCount
        }
        
        print("現在の猫番号は\(self.nowCatNumber)")
        print("現在の猫の歩数は\(self.userDefaultUtil.readCatStep(catNumber: self.nowCatNumber))")
    }
    
    // 通常の歩数カウント開始
    func startStepCount(stepCountLabel: UILabel, totalStepCountLabel: UILabel) {
        maxStepCount = userDefaultUtil.readSanpStepCount()
        totalStepCountLabel.text = "累計\(userDefaultUtil.readTotalSanpStepCount())歩"
        pedometer.startUpdates(from: Date()) { data, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                stepCountLabel.text = "いま\(data.numberOfSteps)歩"
                self.sanpoStepCount = data.numberOfSteps.intValue
                self.startCatStepCount(catChangeTimeStep: 0, sanpoStepCount: self.sanpoStepCount)
                if (self.maxStepCount < data.numberOfSteps.intValue) {
                    self.userDefaultUtil.saveSanpoStepCount(stepCount: data.numberOfSteps.intValue)
                }
                totalStepCountLabel.text = "累計\(data.numberOfSteps.intValue + self.totalStepCount)歩"
                self.userDefaultUtil.saveSanpoTotalStepCount(totalStepCount: data.numberOfSteps.intValue + self.totalStepCount)
                
                // 累計歩数に応じて猫が着いてきたメッセージを送信
                if case StepBoarder().boarder_01 ... StepBoarder().boarder_02 = (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 1)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_01.rawValue, catNumber: "01")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 1)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "01")
                        self.nowCatNumber = "01"
                        self.catChangeTimeStep = data.numberOfSteps.intValue
                    }
                } else if case StepBoarder().boarder_02 ... StepBoarder().boarder_03 = (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 2)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_02.rawValue, catNumber: "02")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 2)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "02")
                        self.nowCatNumber = "02"
                        self.catChangeTimeStep = data.numberOfSteps.intValue
                    }
                } else if case StepBoarder().boarder_03 ... StepBoarder().boarder_04 = (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 3)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_03.rawValue, catNumber: "03")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 3)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "03")
                        self.nowCatNumber = "03"
                        self.catChangeTimeStep = data.numberOfSteps.intValue
                    }
                } else if case StepBoarder().boarder_04 ... StepBoarder().boarder_05 = (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 4)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_04.rawValue, catNumber: "04")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 4)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "04")
                        self.nowCatNumber = "04"
                        self.catChangeTimeStep = data.numberOfSteps.intValue
                    }
                } else if case StepBoarder().boarder_05 ... StepBoarder().boarder_06 = (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 5)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_05.rawValue, catNumber: "05")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 5)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "05")
                        self.nowCatNumber = "05"
                        self.catChangeTimeStep = data.numberOfSteps.intValue
                    }
                } else if case StepBoarder().boarder_06 ... StepBoarder().boarder_07 = (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 6)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_06.rawValue, catNumber: "06")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 6)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "06")
                        self.nowCatNumber = "06"
                        self.catChangeTimeStep = data.numberOfSteps.intValue
                    }
                } else if case StepBoarder().boarder_07 ... StepBoarder().boarder_08 = (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 7)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_07.rawValue, catNumber: "07")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 7)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "07")
                        self.nowCatNumber = "07"
                        self.catChangeTimeStep = data.numberOfSteps.intValue
                    }
                } else if case StepBoarder().boarder_08 ... StepBoarder().boarder_09 = (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 8)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_08.rawValue, catNumber: "08")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 8)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "08")
                        self.nowCatNumber = "08"
                        self.catChangeTimeStep = data.numberOfSteps.intValue
                    }
                } else if case StepBoarder().boarder_09 ... StepBoarder().boarder_10 = (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 9)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_09.rawValue, catNumber: "09")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 9)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "09")
                        self.nowCatNumber = "09"
                        self.catChangeTimeStep = data.numberOfSteps.intValue
                    }
                } else if StepBoarder().boarder_10 < (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 10)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_10.rawValue, catNumber: "10")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 10)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "10")
                        self.nowCatNumber = "10"
                        self.catChangeTimeStep = data.numberOfSteps.intValue
                    }
                }
            }
        }
    }
    
    func stopSanpo() {
        pedometer.stopUpdates()
    }
    
    func sendNotification(catName: String, catNumber: String) {
        let content = UNMutableNotificationContent()
        content.title = "お知らせ"
        content.body = "\(catName)がついて来ました"
        content.sound = UNNotificationSound.default

        // 直ぐに通知を表示
        let request = UNNotificationRequest(identifier: "immediately", content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        delegate?.changeCatImage(catNumber: catNumber)
    }
}
