import UIKit

class ViewController: UIViewController {

    // 各ボタン状態定義
    enum ButtonStatus {
        case off    // 非アクティブ
        case on     // アクティブ
        case ok     // 確定
    }
    
    var buttonStatus: [ButtonStatus] = [.off, .off, .off, .off, .off]
    var cursolImages: [UIImageView] = []
    
    // 左ボタン
    @IBOutlet weak var cursol0ImageView: UIImageView!
    @IBAction func leftTap(_ sender: Any) {
        if (buttonStatus[0] == ButtonStatus.off) {
            cursol0ImageView.image = UIImage(named: "cursol_0_on")!
            buttonStatus[0] = ButtonStatus.on
        } else if (buttonStatus[0] == ButtonStatus.on || buttonStatus[0] == ButtonStatus.ok) {
            cursol0ImageView.image = UIImage(named: "cursol_0_off")!
            buttonStatus[0] = ButtonStatus.off
        }
    }
    
    // 左上ボタン
    @IBOutlet weak var cursol1ImageView: UIImageView!
    @IBAction func leftUpTap(_ sender: Any) {
        if (buttonStatus[1] == ButtonStatus.off) {
            cursol1ImageView.image = UIImage(named: "cursol_1_on")!
            buttonStatus[1] = ButtonStatus.on
        } else if (buttonStatus[1] == ButtonStatus.on || buttonStatus[1] == ButtonStatus.ok) {
            cursol1ImageView.image = UIImage(named: "cursol_1_off")!
            buttonStatus[1] = ButtonStatus.off
        }
    }
    
    //  上ボタン
    @IBOutlet weak var cursol2ImageView: UIImageView!
    @IBAction func upTap(_ sender: Any) {
        if (buttonStatus[2] == ButtonStatus.off) {
            cursol2ImageView.image = UIImage(named: "cursol_2_on")!
            buttonStatus[2] = ButtonStatus.on
        } else if (buttonStatus[2] == ButtonStatus.on || buttonStatus[2] == ButtonStatus.ok) {
            cursol2ImageView.image = UIImage(named: "cursol_2_off")!
            buttonStatus[2] = ButtonStatus.off
        }
    }
    
    // 右上ボタン
    @IBOutlet weak var cursol3ImageView: UIImageView!
    @IBAction func rightUpTap(_ sender: Any) {
        if (buttonStatus[3] == ButtonStatus.off) {
            cursol3ImageView.image = UIImage(named: "cursol_3_on")!
            buttonStatus[3] = ButtonStatus.on
        } else if (buttonStatus[3] == ButtonStatus.on || buttonStatus[3] == ButtonStatus.ok) {
            cursol3ImageView.image = UIImage(named: "cursol_3_off")!
            buttonStatus[3] = ButtonStatus.off
        }
    }
    
    // 右ボタン
    @IBOutlet weak var cursol4ImageView: UIImageView!
    @IBAction func rightTap(_ sender: Any) {
        if (buttonStatus[4] == ButtonStatus.off) {
            cursol4ImageView.image = UIImage(named: "cursol_4_on")!
            buttonStatus[4] = ButtonStatus.on
        } else if (buttonStatus[4] == ButtonStatus.on || buttonStatus[4] == ButtonStatus.ok) {
            cursol4ImageView.image = UIImage(named: "cursol_4_off")!
            buttonStatus[4] = ButtonStatus.off
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cursolImages.append(cursol0ImageView)
        cursolImages.append(cursol1ImageView)
        cursolImages.append(cursol2ImageView)
        cursolImages.append(cursol3ImageView)
        cursolImages.append(cursol4ImageView)
    }
    @IBOutlet weak var assistText: UILabel!
    
    @IBAction func checkButton(_ sender: Any) {
        if (!buttonStatus.contains(ButtonStatus.on)) {
            assistText.text = "まずは矢印をタップしてアクティブにするにゃ！"
            return
        }
        while !buttonStatus.contains(ButtonStatus.ok) {
            let buttonNumber = Int.random(in: 0 ..< 5)
            if (buttonStatus[buttonNumber] == ButtonStatus.on) {
                cursolImages[buttonNumber].image = UIImage(named: "cursol_\(buttonNumber)_ok")!
                buttonStatus[buttonNumber] = ButtonStatus.ok
                assistText.text = "進む方向を決めるにゃ！"
            }
        }
    }
}
