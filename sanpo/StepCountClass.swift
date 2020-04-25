import Foundation
import CoreMotion
import UIKit

class StepCountClass {
    //  UserDefaultsインスタンスの生成
    let userDefaults = UserDefaults.standard
    
    var pedometer: CMPedometer!
    
    // 一回の散歩での最大数記録
    var maxStepCount: Int
    
    // 累計歩数
    var totalStepCount: Int = 0
    
    init() {
        maxStepCount = 0
        totalStepCount = readTotalSanpStepCount()
        pedometer = CMPedometer()
    }

    func startStepCount(stepCountLabel: UILabel, totalStepCountLabel: UILabel) {
        maxStepCount = readSanpStepCount()
        totalStepCountLabel.text = "累計\(readTotalSanpStepCount())歩"
        pedometer.startUpdates(from: Date()) { data, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                stepCountLabel.text = "いま\(data.numberOfSteps)歩"
                if (self.maxStepCount < data.numberOfSteps.intValue) {
                    self.saveSanpoStepCount(stepCount: data.numberOfSteps.intValue)
                }
                self.totalStepCount += data.numberOfSteps.intValue
                totalStepCountLabel.text = "累計\(self.totalStepCount)歩"
                self.saveSanpoTotalStepCount(totalStepCount: self.totalStepCount)
                
                // 累計歩数に応じて猫が着いてきたメッセージを送信
                if case StepBoarder.boarder_01.rawValue ... StepBoarder.boarder_02.rawValue = self.totalStepCount {
                    self.sendNotification(catName: StepBoarderCat.boarder_01.rawValue)
                } else if case StepBoarder.boarder_02.rawValue ... StepBoarder.boarder_03.rawValue = self.totalStepCount {
                    self.sendNotification(catName: StepBoarderCat.boarder_02.rawValue)
                }else if case StepBoarder.boarder_03.rawValue ... StepBoarder.boarder_03.rawValue = self.totalStepCount {
                    self.sendNotification(catName: StepBoarderCat.boarder_03.rawValue)
                }else if case StepBoarder.boarder_04.rawValue ... StepBoarder.boarder_04.rawValue = self.totalStepCount {
                    self.sendNotification(catName: StepBoarderCat.boarder_04.rawValue)
                }else if case StepBoarder.boarder_05.rawValue ... StepBoarder.boarder_05.rawValue = self.totalStepCount {
                    self.sendNotification(catName: StepBoarderCat.boarder_05.rawValue)
                }else if case StepBoarder.boarder_06.rawValue ... StepBoarder.boarder_06.rawValue = self.totalStepCount {
                    self.sendNotification(catName: StepBoarderCat.boarder_06.rawValue)
                }else if case StepBoarder.boarder_07.rawValue ... StepBoarder.boarder_07.rawValue = self.totalStepCount {
                    self.sendNotification(catName: StepBoarderCat.boarder_07.rawValue)
                }else if case StepBoarder.boarder_08.rawValue ... StepBoarder.boarder_08.rawValue = self.totalStepCount {
                    self.sendNotification(catName: StepBoarderCat.boarder_08.rawValue)
                }else if case StepBoarder.boarder_09.rawValue ... StepBoarder.boarder_09.rawValue = self.totalStepCount {
                    self.sendNotification(catName: StepBoarderCat.boarder_09.rawValue)
                }else if case StepBoarder.boarder_10.rawValue ... StepBoarder.boarder_10.rawValue = self.totalStepCount {
                    self.sendNotification(catName: StepBoarderCat.boarder_10.rawValue)
                }
            }
        }
    }

    // userDefaultから今の歩数取得
    func readSanpStepCount() -> Int {
       // Keyを指定して読み込み
        let stepCount: Int = userDefaults.object(forKey: "SanpoStepCount") as? Int ?? 0
        return stepCount
    }
    
    // userDefaultから累計の歩数取得
    func readTotalSanpStepCount() -> Int {
       // Keyを指定して読み込み
        let totalStepCount: Int = userDefaults.object(forKey: "SanpoTotalStepCount") as? Int ?? 0
        return totalStepCount
    }
    
    // userDefaultに今の歩数記録
    func saveSanpoStepCount(stepCount: Int){
       // Keyを指定して保存
       userDefaults.set(stepCount, forKey: "SanpoStepCount")
    }
    
    // userDefaultに累計の歩数記録
    func saveSanpoTotalStepCount(totalStepCount: Int){
       // Keyを指定して保存
       userDefaults.set(totalStepCount, forKey: "SanpoTotalStepCount")
    }
    
    func stopSanpo() {
        pedometer.stopUpdates()
    }
    
    func sendNotification(catName: String) {
        let content = UNMutableNotificationContent()
        content.title = "猫からのお知らせ"
        content.body = "\(catName)がついて来ました"
        content.sound = UNNotificationSound.default

        // 直ぐに通知を表示
        let request = UNNotificationRequest(identifier: "immediately", content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
