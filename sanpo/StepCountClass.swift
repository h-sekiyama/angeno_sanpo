import Foundation
import CoreMotion
import UIKit

protocol MainDelegate: class {
    func changeCatImage(catNumber: String)
}

class StepCountClass {
    weak var delegate: MainDelegate?
    
    var pedometer: CMPedometer!
    
    // 一回の散歩での最大数記録
    var maxStepCount: Int
    
    // 累計歩数
    var totalStepCount: Int = 0
    
    var nowCatInfo: String = ""
    
    let userDefaultUtil = UserDefaultUtil()
    
    init() {
        maxStepCount = 0
        totalStepCount = userDefaultUtil.readTotalSanpStepCount()
        pedometer = CMPedometer()
        nowCatInfo = userDefaultUtil.readNowCatNumber()
    }

    func startStepCount(stepCountLabel: UILabel, totalStepCountLabel: UILabel) {
        
        maxStepCount = userDefaultUtil.readSanpStepCount()
        totalStepCountLabel.text = "累計\(userDefaultUtil.readTotalSanpStepCount())歩"
        pedometer.startUpdates(from: Date()) { data, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                stepCountLabel.text = "いま\(data.numberOfSteps)歩"
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
                    }
                } else if case StepBoarder().boarder_02 ... StepBoarder().boarder_03 = (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 2)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_02.rawValue, catNumber: "02")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 2)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "02")
                    }
                } else if case StepBoarder().boarder_03 ... StepBoarder().boarder_04 = (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 3)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_03.rawValue, catNumber: "03")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 3)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "03")
                    }
                } else if case StepBoarder().boarder_04 ... StepBoarder().boarder_05 = (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 4)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_04.rawValue, catNumber: "04")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 4)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "04")
                    }
                } else if case StepBoarder().boarder_05 ... StepBoarder().boarder_06 = (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 5)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_05.rawValue, catNumber: "05")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 5)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "05")
                    }
                } else if case StepBoarder().boarder_06 ... StepBoarder().boarder_07 = (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 6)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_06.rawValue, catNumber: "06")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 6)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "06")
                    }
                } else if case StepBoarder().boarder_07 ... StepBoarder().boarder_08 = (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 7)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_07.rawValue, catNumber: "07")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 7)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "07")
                    }
                } else if case StepBoarder().boarder_08 ... StepBoarder().boarder_09 = (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 8)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_08.rawValue, catNumber: "08")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 8)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "08")
                    }
                } else if case StepBoarder().boarder_09 ... StepBoarder().boarder_10 = (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 9)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_09.rawValue, catNumber: "09")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 9)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "09")
                    }
                } else if StepBoarder().boarder_10 < (data.numberOfSteps.intValue + self.totalStepCount) {
                    if (self.userDefaultUtil.readNotificationFlag(stepBoarder: 10)) {
                        self.sendNotification(catName: StepBoarderCat.boarder_10.rawValue, catNumber: "10")
                        self.userDefaultUtil.saveNotificationFlag(stepBoarder: 10)
                        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: "10")
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
