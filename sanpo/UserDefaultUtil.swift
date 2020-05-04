import Foundation

class UserDefaultUtil {
    
    //  UserDefaultsインスタンスの生成
    let userDefaults = UserDefaults.standard
    
    // userDefaultから今の歩数取得
    func readSanpStepCount() -> Int {
        return userDefaults.object(forKey: "SanpoStepCount") as? Int ?? 0
    }
    
    // userDefaultに今の歩数記録
    func saveSanpoStepCount(stepCount: Int){
       userDefaults.set(stepCount, forKey: "SanpoStepCount")
    }
    
    // userDefaultから累計の歩数取得
    func readTotalSanpStepCount() -> Int {
       // Keyを指定して読み込み
        return userDefaults.object(forKey: "SanpoTotalStepCount") as? Int ?? 0
    }
    
    // userDefaultに累計の歩数記録
    func saveSanpoTotalStepCount(totalStepCount: Int){
       userDefaults.set(totalStepCount, forKey: "SanpoTotalStepCount")
    }
    
    // userDefaultから通知表示済みフラグ取得
    func readNotificationFlag(stepBoarder: Int) -> Bool {
        return userDefaults.object(forKey: "SanpoNotification_\(stepBoarder)") as? Bool ?? true
    }
    
    // userDefaultから通知表示済みフラグ記録
    func saveNotificationFlag(stepBoarder: Int){
       userDefaults.set(false, forKey: "SanpoNotification_\(stepBoarder)")
    }
    
    // userDefaultから現在連れている猫情報を取得
    func readNowCatNumber() -> String {
        return userDefaults.object(forKey: "SanpoNowCatInfo") as? String ?? ""
    }
    
    // userDefaultから通知表示済みフラグ記録
    func saveNowCatNumber(nowCatNumber: String){
        userDefaults.set(nowCatNumber, forKey: "SanpoNowCatInfo")
    }
    
    // 各猫ごとの歩数を取得
    func readCatStep(catNumber: String) ->  Int {
        return userDefaults.object(forKey: "SanpoCatLove_\(catNumber)") as? Int ?? 0
    }
    
    // 各猫ごとの歩数を記録
    func saveCatStep(stepCount: Int, catNumber: String){
        userDefaults.set(stepCount, forKey: "SanpoCatLove_\(catNumber)")
    }
    
    // 各猫ごとのイベントを見たか管理するフラグを取得
    func readCatEventFlag(catNumber: String, eventNumber: Int) ->  Bool {
        return userDefaults.object(forKey: "SanpoCatEventFlag_\(catNumber)_\(String(eventNumber))") as? Bool ?? false
    }
    
    // 各猫ごとのイベントを見たか管理するフラグを記録
    func saveCatEventFlag(catNumber: String, eventNumber: Int){
        userDefaults.set(true, forKey: "SanpoCatEventFlag_\(catNumber)_\(String(eventNumber))")
    }
}
