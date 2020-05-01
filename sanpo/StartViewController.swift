import Foundation
import UIKit

class StartViewController: UIViewController {
    
    let musicPlayer  = MusicPlayer()
    
    // Nextボタン押下時の処理
    @IBAction func goNext(_ sender: Any) {
        
        let mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main") as UIViewController
        
        mainViewController.modalPresentationStyle = .fullScreen
        
        musicPlayer.audioPlayer.stop()
        // Viewの移動する.
        self.present(mainViewController, animated: true, completion: nil)
    }
    
    //  インスタンスの生成
    let userDefaults = UserDefaults.standard
    
    // 散歩数記録変数
    var nowStepCount: Int = 0
    
    @IBOutlet weak var maxStepCountLabel: UILabel!
    @IBOutlet weak var totalStepCountLabel: UILabel!
    
    // 各種猫画像
//    @IBOutlet weak var cat01: UIImageView!
    @IBOutlet weak var cat01: UIButton!
    @IBAction func cat01(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ModalViewController", bundle: nil)
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_01.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_01.rawValue
        modalView.catNumber = "01"
        modalView.parentScreen = "start"
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat02: UIButton!
    @IBAction func cat02(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ModalViewController", bundle: nil)
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_02.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_02.rawValue
        modalView.catNumber = "02"
        modalView.parentScreen = "start"
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat03: UIButton!
    @IBAction func cat03(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ModalViewController", bundle: nil)
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_03.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_03.rawValue
        modalView.catNumber = "03"
        modalView.parentScreen = "start"
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat04: UIButton!
    @IBAction func cat04(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ModalViewController", bundle: nil)
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_04.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_04.rawValue
        modalView.catNumber = "04"
        modalView.parentScreen = "start"
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat05: UIButton!
    @IBAction func cat05(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ModalViewController", bundle: nil)
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_05.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_05.rawValue
        modalView.catNumber = "05"
        modalView.parentScreen = "start"
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat06: UIButton!
    @IBAction func cat06(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ModalViewController", bundle: nil)
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_06.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_06.rawValue
        modalView.catNumber = "06"
        modalView.parentScreen = "start"
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat07: UIButton!
    @IBAction func cat07(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ModalViewController", bundle: nil)
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_07.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_07.rawValue
        modalView.catNumber = "07"
        modalView.parentScreen = "start"
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat08: UIButton!
    @IBAction func cat08(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ModalViewController", bundle: nil)
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_08.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_08.rawValue
        modalView.catNumber = "08"
        modalView.parentScreen = "start"
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat09: UIButton!
    @IBAction func cat09(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ModalViewController", bundle: nil)
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_09.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_09.rawValue
        modalView.catNumber = "09"
        modalView.parentScreen = "start"
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat10: UIButton!
    @IBAction func cat10(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ModalViewController", bundle: nil)
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_10.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_10.rawValue
        modalView.catNumber = "10"
        modalView.parentScreen = "start"
        self.present(modalView, animated: true, completion: nil)
    }
    
    @IBOutlet weak var homeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // mp3音声(SOUND.mp3)の再生
        musicPlayer.playSound(name: "menuettm")
        
        
        cat01.isHidden = true
        cat02.isHidden = true
        cat03.isHidden = true
        cat04.isHidden = true
        cat05.isHidden = true
        cat06.isHidden = true
        cat07.isHidden = true
        cat08.isHidden = true
        cat09.isHidden = true
        cat10.isHidden = true

        // 一回の散歩での最大歩数表示
        let stepCount: Int = userDefaults.object(forKey: "SanpoStepCount") as? Int ?? 0
        maxStepCountLabel.text =  "\(stepCount)歩"
        
        // 累計の歩数表示
        let totalStepCount: Int = userDefaults.object(forKey: "SanpoTotalStepCount") as? Int ?? 0
        totalStepCountLabel.text =  "\(totalStepCount)歩"
        
        if (totalStepCount > StepBoarder.boarder_01.rawValue) {
            cat01.isHidden = false
        }
        if (totalStepCount > StepBoarder.boarder_02.rawValue) {
            cat02.isHidden = false
        }
        if (totalStepCount > StepBoarder.boarder_03.rawValue) {
            cat03.isHidden = false
        }
        if (totalStepCount > StepBoarder.boarder_04.rawValue) {
            cat04.isHidden = false
        }
        if (totalStepCount > StepBoarder.boarder_05.rawValue) {
            cat05.isHidden = false
        }
        if (totalStepCount > StepBoarder.boarder_06.rawValue) {
            cat06.isHidden = false
        }
        if (totalStepCount > StepBoarder.boarder_07.rawValue) {
            cat07.isHidden = false
        }
        if (totalStepCount > StepBoarder.boarder_08.rawValue) {
            cat08.isHidden = false
        }
        if (totalStepCount > StepBoarder.boarder_09.rawValue) {
            cat09.isHidden = false
        }
        if (totalStepCount > StepBoarder.boarder_10.rawValue) {
            cat10.isHidden = false
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // 使用する端末の中心座標習得
        let centerX = self.view.frame.midX
        let centerY = self.view.frame.midY
        
        // 使用する端末の最大縦横習得
//        let deviceWidth = self.view.frame.maxX
//        let deviceHeight = self.view.frame.maxY
        
        homeImage.center.x = self.view.center.x
        homeImage.center.y = self.view.center.y
        
        cat01.frame = CGRect(x: centerX - 4, y: centerY + 40, width: 120, height: 120)
        cat02.frame = CGRect(x: centerX - 202, y: centerY - 50, width: 120, height: 120)
        cat03.frame = CGRect(x: centerX - 123, y: centerY - 58, width: 120, height: 120)
        cat04.frame = CGRect(x: centerX + 28, y: centerY + 128, width: 120, height: 120)
        cat05.frame = CGRect(x: centerX + 1, y: centerY - 60, width: 120, height: 120)
        cat06.frame = CGRect(x: centerX - 110, y: centerY + 74, width: 120, height: 120)
        cat07.frame = CGRect(x: centerX - 193, y: centerY + 140, width: 120, height: 120)
        cat08.frame = CGRect(x: centerX - 163, y: centerY - 191, width: 120, height: 120)
        cat09.frame = CGRect(x: centerX - 20, y: centerY - 240, width: 120, height: 120)
        cat10.frame = CGRect(x: centerX + 90, y: centerY + 1, width: 120, height: 120)
    }
}
