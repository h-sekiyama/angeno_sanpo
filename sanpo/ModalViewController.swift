import Foundation
import UIKit
import Toast_Swift

protocol StoryDelegate: class {
    func talkingWithCat(eventNumber: Int, catNumber: String)
}

class ModalViewController:  UIViewController {
    weak var delegate: StoryDelegate?
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
    
    @IBOutlet weak var storyButtonsStack: UIStackView!
    // ストーリー回想ボタン1
    @IBOutlet weak var storyButton1: UIButton!
    @IBAction func storyButton1(_ sender: Any) {
        talkingWithCat(eventNumber: 0, catNumber: self.catNumber)
    }
    // ストーリー回想ボタン2
    @IBOutlet weak var storyButton2: UIButton!
    @IBAction func storyButton2(_ sender: Any) {
        talkingWithCat(eventNumber: 1, catNumber: self.catNumber)
    }
    // ストーリー回想ボタン3
    @IBOutlet weak var storyButton3: UIButton!
    @IBAction func storyButton3(_ sender: Any) {
        talkingWithCat(eventNumber: 2, catNumber: self.catNumber)
    }
    
    @IBOutlet weak var takeCatButton: UIButton!
    @IBAction func takeCatButton(_ sender: Any) {
        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: catNumber)
        self.view.makeToast("\(catName)を一緒に連れて行きます")
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
            // ストーリー回想ボタンを表示するのは家画面のモーダルのみ
            storyButtonsStack.isHidden = true
            // 猫を連れて行くボタンを表示するのは家画面のモーダルのみ
            takeCatButton.isHidden = true
        }
        
        // ストーリーボタンON/OFF描画
        updateStoryButtonView()
        
        // 好感度ゲージ描画
        updateCatLoveGauge()

    }
    
    @IBAction func modalClose(_ sender: Any) {
        StepCountClass.isOpenOtherModal = false
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeModal(_ sender: Any) {
        StepCountClass.isOpenOtherModal = false
        dismiss(animated: true, completion: nil)
    }
    
    // 猫との会話イベント発生処理
    func talkingWithCat(eventNumber: Int, catNumber: String) {
        StepCountClass.isOpenOtherModal = true
        let storyboard: UIStoryboard = UIStoryboard.init(name: "TalkingCatModalViewController", bundle: nil)
        let talkingView = storyboard.instantiateViewController(withIdentifier: "talking") as! TalkingCatModalViewController
        talkingView.catNumber = catNumber
        talkingView.eventNumber = eventNumber
        self.present(talkingView, animated: false, completion: nil)
    }
    
    // ストーリー回想ボタンON/OFF表示切り替え処理
    func updateStoryButtonView() {
        // ストーリー1
        if (userDefaultUtil.readCatEventFlag(catNumber: self.catNumber, eventNumber: 0)) {
            storyButton1.isEnabled = true
            storyButton1.setBackgroundImage(UIImage(named: "archive_on"), for: .normal)
            storyButton1.setTitleColor(UIColor(red: 180/255, green: 95/255, blue: 70/255, alpha: 1), for: .normal)
        } else {
            storyButton1.isEnabled = false
            storyButton1.setTitleColor(UIColor(red: 125/255, green: 95/255, blue: 80/255, alpha: 0.5), for: .normal)
        }
        // ストーリー2
        if (userDefaultUtil.readCatEventFlag(catNumber: self.catNumber, eventNumber: 1)) {
            storyButton2.isEnabled = true
            storyButton2.setBackgroundImage(UIImage(named: "archive_on"), for: .normal)
            storyButton2.setTitleColor(UIColor(red: 180/255, green: 95/255, blue: 70/255, alpha: 1), for: .normal)
        } else {
            storyButton2.isEnabled = false
            storyButton2.setTitleColor(UIColor(red: 125/255, green: 95/255, blue: 80/255, alpha: 0.5), for: .normal)
        }
        
        // ストーリー3
        if (userDefaultUtil.readCatEventFlag(catNumber: self.catNumber, eventNumber: 2)) {
            storyButton3.isEnabled = true
            storyButton3.setBackgroundImage(UIImage(named: "archive_on"), for: .normal)
            storyButton3.setTitleColor(UIColor(red: 180/255, green: 95/255, blue: 70/255, alpha: 1), for: .normal)
        } else {
            storyButton3.isEnabled = false
            storyButton3.setTitleColor(UIColor(red: 125/255, green: 95/255, blue: 80/255, alpha: 0.5), for: .normal)
        }
    }
    
    // 好感度ゲージ描画処理
    func updateCatLoveGauge() {
        gauge_back.translatesAutoresizingMaskIntoConstraints = true

        // 好感度ゲージ枠の幅、高さ、X座標、Y座標を取得
        let gaugeHeight = self.gauge.frame.height
        let gaugeXPosition = self.gauge.frame.minX
        let gaugeYPosition = self.gauge.frame.minY
        
        // 好感度ゲージの幅を歩数を元に算出
        var gaugeBackWidth = CGFloat(userDefaultUtil.readCatStep(catNumber: self.catNumber)) / CGFloat(CAT_EVENT_STEP) * 208
        if (gaugeBackWidth > 208) {
            gaugeBackWidth = 208
        }
        gauge_back.frame = CGRect(x: gaugeXPosition + 25, y: gaugeYPosition + 12, width: gaugeBackWidth, height: gaugeHeight - 20)
    }
}
