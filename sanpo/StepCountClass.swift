import Foundation
import CoreMotion
import UIKit

class StepCountClass {
    //  UserDefaultsインスタンスの生成
    let userDefaults = UserDefaults.standard
    
    var pedometer: CMPedometer!
    
    // 散歩数記録変数
    var nowStepCount: Int
    
    init() {
        nowStepCount = 0
        pedometer = CMPedometer()
    }

    func startStepCount(stepCount: UILabel) {
        // always
        pedometer.startUpdates(from: Date()) { data, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                stepCount.text = "いま\(data.numberOfSteps)歩"
                if (self.nowStepCount < data.numberOfSteps.intValue) {
                    self.saveSanpoStepCount(stepCount: data.numberOfSteps.intValue)
                }
            }
        }
        nowStepCount = readSanpStepCount()
    }

    // userDefaultから歩数取得
    func readSanpStepCount() -> Int {
       // Keyを指定して読み込み
        let stepCount: Int = userDefaults.object(forKey: "SanpoStepCount") as? Int ?? 0
        return stepCount
    }
    
    // userDefaultに歩数記録
    func saveSanpoStepCount(stepCount: Int){
       // Keyを指定して保存
       userDefaults.set(stepCount, forKey: "SanpoStepCount")
    }
    
    func stopSanpo() {
        pedometer.stopUpdates()
    }
}
