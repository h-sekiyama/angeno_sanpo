import UIKit
import AVFoundation

class ViewController: UIViewController, MainDelegate {

    // 各ボタン状態定義
    enum ButtonStatus {
        case off    // 非アクティブ
        case on     // アクティブ
        case ok     // 確定
    }
    
    var buttonStatus: [Int: ButtonStatus] = [0: .off, 1: .off, 2: .off, 3: .off, 4: .off]
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
    
    // 歩数管理クラス
    let stepCountClass = StepCountClass()
    
    // 今の歩数テキスト
    @IBOutlet weak var stepCount: UILabel!
    
    // 累計歩数テキスト
    @IBOutlet weak var totalStepCount: UILabel!
    
    // 散歩やめるボタンタップ
    @IBAction func stopSanpo(_ sender: Any) {
        
        audioPlayer.stop()
        
        stepCountClass.stopSanpo()
        
        let startViewController = UIStoryboard(name: "Start", bundle: nil).instantiateViewController(withIdentifier: "start") as UIViewController
        
        startViewController.modalPresentationStyle = .fullScreen
        // Viewの移動する.
        self.present(startViewController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var assistText: UILabel!
    
    @IBAction func checkButton(_ sender: Any) {
        // 矢印が一つもアクティブになってないと押せない
        if (buttonStatus.filter({$0.value == ButtonStatus.on}).count == 0) {
            assistText.text = "まずは矢印を２つ以上選ぼう"
            return
        }
        // 既に確定してる矢印がある場合はそれを一旦候補に戻す
        let okCursol = buttonStatus.filter({$0.value == ButtonStatus.ok})
        if (okCursol.count != 0) {
            let okKeyIndex = Array(okCursol.keys)[0]
            cursolImages[okKeyIndex].image = UIImage(named: "cursol_\(okKeyIndex)_on")!
            buttonStatus[okKeyIndex] = ButtonStatus.on
        }
        // アクティブになってる矢印の中から候補となる配列を生成
        let onCursol = buttonStatus.filter({$0.value == ButtonStatus.on})
        let onKeys = Array(onCursol.keys)
        let okCursolIndex = onKeys[Int(arc4random()) % onKeys.count]
        cursolImages[okCursolIndex].image = UIImage(named: "cursol_\(okCursolIndex)_ok")!
        buttonStatus[okCursolIndex] = ButtonStatus.ok
        vibrated(vibrated: true, view: cursolImages[okCursolIndex])
        assistText.text = "こっちに歩いてみよう！"
    }
    
    // 回転数制御
    func degreesToRadians(degrees: Float) -> Float {
        return degrees * Float(M_PI) / 180.0
    }

    // 矢印を震わせる処理
    func vibrated(vibrated:Bool, view: UIView) {
        if vibrated {
            var animation: CABasicAnimation
            animation = CABasicAnimation(keyPath: "transform.rotation")
            animation.duration = 0.15
            animation.fromValue = degreesToRadians(degrees: 5.0)
            animation.toValue = degreesToRadians(degrees: -5.0)
            animation.repeatCount = 5
            animation.autoreverses = false
            view.layer .add(animation, forKey: "VibrateAnimationKey")
        }
        else {
            view.layer.removeAnimation(forKey: "VibrateAnimationKey")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var catImage: UIImageView!
    
    func changeCatImage(catNumber: String) {
        catImage.image = UIImage(named: "cat\(catNumber)")!
    }
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // mp3音声(SOUND.mp3)の再生
        playSound(name: "brightening")
        
        stepCountClass.delegate = self

        cursolImages.append(cursol0ImageView)
        cursolImages.append(cursol1ImageView)
        cursolImages.append(cursol2ImageView)
        cursolImages.append(cursol3ImageView)
        cursolImages.append(cursol4ImageView)
        
        if (stepCountClass.readNowCatInfo() != "") {
            changeCatImage(catNumber: stepCountClass.readNowCatInfo())
        }
        
        stepCountClass.startStepCount(stepCountLabel: stepCount, totalStepCountLabel: totalStepCount)
    }
}

extension ViewController: AVAudioPlayerDelegate {
    func playSound(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("音源ファイルが見つかりません")
            return
        }

        do {
            // AVAudioPlayerのインスタンス化
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))

            // AVAudioPlayerのデリゲートをセット
            audioPlayer.delegate = self

            // 音声の再生
            audioPlayer.play()
        } catch {
        }
    }
}
