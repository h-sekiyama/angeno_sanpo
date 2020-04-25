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
    @IBOutlet weak var cat01: UIImageView!
    @IBOutlet weak var cat02: UIImageView!
    @IBOutlet weak var cat03: UIImageView!
    @IBOutlet weak var cat04: UIImageView!
    @IBOutlet weak var cat05: UIImageView!
    @IBOutlet weak var cat06: UIImageView!
    @IBOutlet weak var cat07: UIImageView!
    @IBOutlet weak var cat08: UIImageView!
    @IBOutlet weak var cat09: UIImageView!
    @IBOutlet weak var cat10: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
}
