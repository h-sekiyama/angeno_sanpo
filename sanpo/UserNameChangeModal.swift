import Foundation
import UIKit
import Toast_Swift

class UserNameChangeModal: UIViewController, UITextFieldDelegate {
    // UserDefault管理クラス
    let userDefaultUtil = UserDefaultUtil()
    // モーダル
    @IBOutlet weak var modalView: UIView!
    // 名前入力テキストフィールド
    @IBOutlet weak var nameInputArea: UITextField!
    // モーダル外をタップ
    @IBAction func modalClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    // 閉じるボタンをタップ
    @IBAction func modalCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func nameInputAction(_ sender: UITextField) {
        nameInputArea.text = sender.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameInputArea.text = userDefaultUtil.readUserName()
        
        let backgroundImage = UIImage(named: "win_bg")!
        self.modalView.backgroundColor = UIColor(patternImage: backgroundImage)
                self.modalView.layer.borderColor = UIColor(red: 173/255, green: 100/255, blue: 56/255, alpha: 1).cgColor
        
        self.nameInputArea.delegate = self
        self.nameInputArea.returnKeyType = UIReturnKeyType.done
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //非表示にする。
        if(nameInputArea.isFirstResponder) {
            nameInputArea.resignFirstResponder()
        }
        
    }
    
    //改行、または、Returnキーが押されたら呼び出されるメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //キーボードをしまう
        self.view.endEditing(true)
        userDefaultUtil.saveUserName(userName: nameInputArea.text ?? "奴隷")
        self.view.makeToast("名前を\(nameInputArea.text ?? "奴隷")に変更しました！")
        return false
    }
    
    // 適当な所でこのターゲットアクションを設定してください。
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        textField.text = String(text.prefix(5))
    }
}
