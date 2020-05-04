import Foundation
import UIKit

protocol ModalDelegate: class {
    func closeTalkScreen()
}

class  TalkingCatModalViewController: UIViewController {
    var delegate: ModalDelegate?
    @IBOutlet var modalView: UIView!
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var catTalkingText: UILabel!
    @IBAction func screenTap(_ sender: Any) {
        if (nowTalkingTextNum == self.catTalkTextSize - 1) {
            delegate?.closeTalkScreen()
            dismiss(animated: false, completion: nil)
        } else {
            catTalkingText.text = catTalkText[nowTalkingTextNum + 1]
            nowTalkingTextNum += 1
        }
    }
    
    // 猫の番号
    var catNumber: String = ""
    // イベント番号
    var eventNumber: Int =  0
    // 猫のセリフの内容
    var catTalkText: [String] = [""]
    // 猫のセリフの総数
    var catTalkTextSize: Int = 0
    // 今喋ってるセリフの番号
    var nowTalkingTextNum: Int = 0
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.catTalkText = getCatTalk(catNumber: catNumber, eventNumber: eventNumber)
        self.catTalkTextSize = catTalkText.count
        
        catImage.image = UIImage(named: "cat\(catNumber)")!
        catTalkingText.text = catTalkText[0]
    }
}
