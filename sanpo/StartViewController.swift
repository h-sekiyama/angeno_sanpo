import Foundation
import UIKit

class StartViewController: UIViewController {
    
   // Nextボタン押下時の処理
   @IBAction func goNext(_ sender: Any) {

    let mySecondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main") as UIViewController
    
    mySecondViewController.modalPresentationStyle = .fullScreen
    // Viewの移動する.
    self.present(mySecondViewController, animated: true, completion: nil)
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
