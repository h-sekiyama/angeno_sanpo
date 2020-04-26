import Foundation
import UIKit

class ModalViewController:  UIViewController {
    
    var catName: String = ""
    var catDetail: String = ""
    
    
    @IBOutlet weak var catNameLabel: UILabel!
    @IBOutlet weak var catDetailLabel: UILabel!
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        catNameLabel.text = catName
        catDetailLabel.text = catDetail
    }
    
    @IBAction func closeModal(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
