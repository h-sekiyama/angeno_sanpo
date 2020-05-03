import Foundation
import UIKit
import Toast_Swift

class ModalViewController:  UIViewController {
    
    let userDefaultUtil = UserDefaultUtil()
    
    var catNumber: String = ""
    var catName: String = ""
    var catDetail: String = ""
    var parentScreen: String = ""
    let stepCountClass = StepCountClass()
    
    @IBOutlet weak var takeCatButton: UIButton!
    @IBAction func takeCatButton(_ sender: Any) {
        self.userDefaultUtil.saveNowCatNumber(nowCatNumber: catNumber)
        self.view.makeToast("\(catName)がついて来ました！")
    }
    
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
        
        if (parentScreen != "start") {
            takeCatButton.isHidden = true
        }
    }
    
    @IBAction func modalClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeModal(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
