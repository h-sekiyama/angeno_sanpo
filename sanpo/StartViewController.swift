import Foundation
import UIKit

class StartViewController: UIViewController {
    
    // Nextボタン押下時の処理
    @IBAction func goNext(_ sender: Any) {
        
        let mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main") as UIViewController
        
        mainViewController.modalPresentationStyle = .fullScreen
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
        let storyboard: UIStoryboard = self.storyboard!
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_01.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_01.rawValue
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat02: UIButton!
    @IBAction func cat02(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_02.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_02.rawValue
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat03: UIButton!
    @IBAction func cat03(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_03.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_03.rawValue
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat04: UIButton!
    @IBAction func cat04(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_04.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_04.rawValue
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat05: UIButton!
    @IBAction func cat05(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_05.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_05.rawValue
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat06: UIButton!
    @IBAction func cat06(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_06.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_06.rawValue
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat07: UIButton!
    @IBAction func cat07(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_07.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_07.rawValue
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat08: UIButton!
    @IBAction func cat08(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_08.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_08.rawValue
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat09: UIButton!
    @IBAction func cat09(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_09.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_09.rawValue
        self.present(modalView, animated: true, completion: nil)
    }
    @IBOutlet weak var cat10: UIButton!
    @IBAction func cat10(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let modalView = storyboard.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalView.catName = StepBoarderCat.boarder_10.rawValue
        modalView.catDetail = StepBoarderCatInfo.boarder_10.rawValue
        self.present(modalView, animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cat01.isHidden = false
        cat02.isHidden = false
        cat03.isHidden = false
        cat04.isHidden = false
        cat05.isHidden = false
        cat06.isHidden = false
        cat07.isHidden = false
        cat08.isHidden = false
        cat09.isHidden = false
        cat10.isHidden = false
        
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
}
