import Foundation

class UserDefaultUtil {
    
    //  UserDefaultsインスタンスの生成
    let userDefaults = UserDefaults.standard
    
    // userDefaultから今の歩数取得
    func readSanpStepCount() -> Int {
       // Keyを指定して読み込み
        let stepCount: Int = userDefaults.object(forKey: "SanpoStepCount") as? Int ?? 0
        return stepCount
    }
    
    // userDefaultに今の歩数記録
    func saveSanpoStepCount(stepCount: Int){
       // Keyを指定して保存
       userDefaults.set(stepCount, forKey: "SanpoStepCount")
    }
    
    // userDefaultから累計の歩数取得
    func readTotalSanpStepCount() -> Int {
       // Keyを指定して読み込み
        let totalStepCount: Int = userDefaults.object(forKey: "SanpoTotalStepCount") as? Int ?? 0
        return totalStepCount
    }
    
    // userDefaultに累計の歩数記録
    func saveSanpoTotalStepCount(totalStepCount: Int){
       // Keyを指定して保存
       userDefaults.set(totalStepCount, forKey: "SanpoTotalStepCount")
    }
    
    // userDefaultから通知表示済みフラグ取得
    func readNotificationFlag(stepBoarder: Int) -> Bool {
       // Keyを指定して読み込み
        let sendNotificationFlag: Bool = userDefaults.object(forKey: "SanpoNotification_\(stepBoarder)") as? Bool ?? true
        return sendNotificationFlag
    }
    
    // userDefaultから通知表示済みフラグ記録
    func saveNotificationFlag(stepBoarder: Int){
       // Keyを指定して保存
       userDefaults.set(false, forKey: "SanpoNotification_\(stepBoarder)")
    }
    
    // userDefaultから現在連れている猫情報を取得
    func readNowCatNumber() -> String {
       // Keyを指定して読み込み
        let nowCatNumber: String = userDefaults.object(forKey: "SanpoNowCatInfo") as? String ?? ""
        return nowCatNumber
    }
    
    // userDefaultから通知表示済みフラグ記録
    func saveNowCatNumber(nowCatNumber: String){
       // Keyを指定して保存
       userDefaults.set(nowCatNumber, forKey: "SanpoNowCatInfo")
    }
}
