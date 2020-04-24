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
    
    @IBOutlet weak var maxStepCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Keyを指定して読み込み
        let stepCount: Int = userDefaults.object(forKey: "SanpoStepCount") as? Int ?? 0
        maxStepCount.text =  "\(stepCount)歩"
    }
}
