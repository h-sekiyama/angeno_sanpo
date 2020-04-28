import Foundation
import UIKit

class ModalViewController:  UIViewController {
    
    var catName: String = ""
    var catDetail: String = ""
    
    
    @IBOutlet weak var catNameLabel: UILabel!
    @IBOutlet weak var catDetailLabel: UILabel!
    
    @IBOutlet weak var modalView: UIView!
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        catNameLabel.text = catName
        catDetailLabel.text = catDetail
        
        let backgroundImage = UIImage(named: "win_bg")!
        self.modalView.backgroundColor = UIColor(patternImage: backgroundImage)
        
        self.modalView.layer.borderColor = UIColor(red: 173/255, green: 100/255, blue: 56/255, alpha: 1).cgColor
    }
    
    @IBAction func closeModal(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
