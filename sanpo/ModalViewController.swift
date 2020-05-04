import Foundation
import UIKit
import Toast_Swift

class ModalViewController:  UIViewController {
    // UserDefault管理クラス
    let userDefaultUtil = UserDefaultUtil()
    // 猫番号
    var catNumber: String = ""
    // 猫の名前
    var catName: String = ""
    // 猫の説明
    var catDetail: String = ""
    // 遷移元の画面名
    var parentScreen: String = ""
    // 歩数管理クラス
    let stepCountClass = StepCountClass()
    
    @IBOutlet weak var takeCatButton: UIButton!
    @IBAction func takeCatButton(_ sender: Any) {
        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: catNumber)
        self.view.makeToast("\(catName)がついて来ました！")
    }
    
    @IBOutlet weak var catNameLabel: UILabel!
    @IBOutlet weak var catDetailLabel: UILabel!
    @IBOutlet weak var modalView: UIView!
    
    // 好感度ゲージ枠
    @IBOutlet weak var gauge: UIImageView!
    // 好感度ゲージ
    @IBOutlet weak var gauge_back: UIView!
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        catNameLabel.text = catName
        catDetailLabel.text = catDetail
        
        let backgroundImage = UIImage(named: "win_bg")!
        self.modalView.backgroundColor = UIColor(patternImage: backgroundImage)
        self.modalView.layer.borderColor = UIColor(red: 173/255, green: 100/255, blue: 56/255, alpha: 1).cgColor
        
        if (parentScreen != "start") {
            takeCatButton.isHidden = true
//            gauge.isHidden = true
//            gauge_back.isHidden = true
        }
        
        /// 以下、好感度ゲージ描画処理
        gauge_back.translatesAutoresizingMaskIntoConstraints = true

        // 好感度ゲージ枠の幅、高さ、X座標、Y座標を取得
        let gaugeHeight = self.gauge.frame.height
        let gaugeXPosition = self.gauge.frame.minX
        let gaugeYPosition = self.gauge.frame.minY
        
        // 好感度ゲージの幅を歩数を元に算出
        var gaugeBackWidth = (CGFloat(userDefaultUtil.readCatStep(catNumber: self.catNumber)) / CAT_EVENT_STEP) * 219
        if (gaugeBackWidth > 219) {
            gaugeBackWidth = 219
        }
        gauge_back.frame = CGRect(x: gaugeXPosition + 25, y: gaugeYPosition + 12, width: gaugeBackWidth, height: gaugeHeight - 20)
    }
    
    @IBAction func modalClose(_ sender: Any) {
        StepCountClass.isOpenOtherModal = false
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeModal(_ sender: Any) {
        StepCountClass.isOpenOtherModal = false
        dismiss(animated: true, completion: nil)
    }
}
