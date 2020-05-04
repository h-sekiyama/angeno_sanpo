import UIKit

// 猫がついて来る歩数
struct StepBoarder {
    let boarder_01: Int = Int(Bundle.main.object(forInfoDictionaryKey: "StepBoarder01") as! String) ?? 0
    let boarder_02: Int = Int(Bundle.main.object(forInfoDictionaryKey: "StepBoarder02") as! String) ?? 0
    let boarder_03: Int = Int(Bundle.main.object(forInfoDictionaryKey: "StepBoarder03") as! String) ?? 0
    let boarder_04: Int = Int(Bundle.main.object(forInfoDictionaryKey: "StepBoarder04") as! String) ?? 0
    let boarder_05: Int = Int(Bundle.main.object(forInfoDictionaryKey: "StepBoarder05") as! String) ?? 0
    let boarder_06: Int = Int(Bundle.main.object(forInfoDictionaryKey: "StepBoarder06") as! String) ?? 0
    let boarder_07: Int = Int(Bundle.main.object(forInfoDictionaryKey: "StepBoarder07") as! String) ?? 0
    let boarder_08: Int = Int(Bundle.main.object(forInfoDictionaryKey: "StepBoarder08") as! String) ?? 0
    let boarder_09: Int = Int(Bundle.main.object(forInfoDictionaryKey: "StepBoarder09") as! String) ?? 0
    let boarder_10: Int = Int(Bundle.main.object(forInfoDictionaryKey: "StepBoarder10") as! String) ?? 0
}

// 猫の名前
public enum StepBoarderCat: String {
    case boarder_01 = "長毛の猫"
    case boarder_02 = "黒猫"
    case boarder_03 = "茶サビ"
    case boarder_04 = "白黒猫"
    case boarder_05 = "白猫"
    case boarder_06 = "ロシアンブルー"
    case boarder_07 = "三毛猫"
    case boarder_08 = "シャム猫"
    case boarder_09 = "マヌル猫"
    case boarder_10 = "スフィンクス"
    
    public static func getCatName(catNumber: String) -> String {
        switch catNumber {
        case "01":
            return boarder_01.rawValue
        case "02":
            return boarder_02.rawValue
        case "03":
            return boarder_03.rawValue
        case "04":
            return boarder_04.rawValue
        case "05":
            return boarder_05.rawValue
        case "06":
            return boarder_06.rawValue
        case "07":
            return boarder_07.rawValue
        case "08":
            return boarder_08.rawValue
        case "09":
            return boarder_09.rawValue
        case "10":
            return boarder_10.rawValue
        default:
            return ""
        }
    }
}

public enum StepBoarderCatInfo: String {
    case boarder_01 = "とても毛が長い。見た目はノルウェージャンフォレストキャットの様だが、実は雑種。とてもわがままで警戒心が強い。でも一度懐くとお腹を見せながらゴロゴロ言い出す。かつおぶしが大好物。"
    case boarder_02 = "通りすがりの黒猫。社交性のカタマリの様な猫で、初めて会う人や猫でも全く警戒心を見せずにすり寄って来る。そのあまりの可愛さにみんなメロメロだ！"
    case boarder_03 = "茶色のサビ猫。とてもお行儀の良い猫で、常に前足を揃えて座るのが特徴。しかし実は縄張り意識が強く、自分の縄張りに侵入して来た猫には容赦ない猫パンチを食らわせる。しっぽの柄が猫の形をしてるのがチャームポイント。"
    case boarder_04 = "白黒のオス猫。近所の猫達を束ねるボス的存在だ。警戒心も強く、常に攻撃姿勢を崩さない。しかしそうなってしまったのは、むかし自分を一番に可愛がってくれていると思っていた家族に捨てられたことで誰も信じられなくなってしまったからなのだ。"
    case boarder_05 = "優雅な白猫。その美貌により周りのオス猫達が日々美味しい食べ物を持って求婚しに来るほど。それに対して期待感を持たせつつ上手くかわすのだが、たまに勘違いしたオスがストーカーになる。でも自分は全く悪くないと思っている。同性からは嫌われている。"
    case boarder_06 = "ロシアンブルーのメス。ツヤツヤしたグレーの毛が特徴で、この種は主人に忠実で献身的な愛情を持つ。この猫も元々は家猫だったが飼い主が高齢により亡くなってしまい保健所に引き取られたが、飼い主がまだ生きていると信じて飼い主を探すために保健所から逃げ出した。"
    case boarder_07 = "三毛猫のオス。遺伝的に三毛猫のオスはめったにいない。その為、小さい頃からずっと仲間はずれにされて来て、そのせいで素直に自分の感情を出すのが苦手。この猫が真に心を開ける日が果たしてやってくるのだろうか。"
    case boarder_08 = "シャム猫のメス。タイが原産の猫で、高貴な血筋の家系じゃないと飼うことが許されなかった時代もあったと言う選ばれし猫。この子もとても気位が高く、絶対に他の猫や人間にこびたりしない。そのため白猫がオスに色目を使っているのを面白く思ってない。"
    case boarder_09 = "マヌルヤマネコのオス。ズングリとした体型と、耳の位置が普通の猫と比べて低い位置にあるのが特徴。日本ではとても珍しい。子供の頃に日本に連れて来られたが、自分の居場所はここではないと感じて富士サファリパークから脱走した。"
    case boarder_10 = "スフィンクスのオス。とても短い産毛しか生えてないのが最大の特徴。暑いのも寒いのも苦手。猫専用のショッピングサイト、Nyamazonの創業者で猫界のカリスマ。猫の長者番付では常に上位3ニャンに入る存在。"
    
    public static func getCatInfo(catNumber: String) -> String {
        switch catNumber {
        case "01":
            return boarder_01.rawValue
        case "02":
            return boarder_02.rawValue
        case "03":
            return boarder_03.rawValue
        case "04":
            return boarder_04.rawValue
        case "05":
            return boarder_05.rawValue
        case "06":
            return boarder_06.rawValue
        case "07":
            return boarder_07.rawValue
        case "08":
            return boarder_08.rawValue
        case "09":
            return boarder_09.rawValue
        case "10":
            return boarder_10.rawValue
        default:
            return ""
        }
    }
}

public func getCatTalk(catNumber: String, eventNumber: Int) -> [String] {
    let boarder_01 = [["結構たくさん歩いたにゃ。お腹減ったからカツオ節よこすにゃ。", "さっさとよこすにゃ！\nまったく、奴隷は使えないにゃ。もしかしてアンジュ（この猫の名前）がついて来てあげてるからって、自分のこと好きだと思って調子に乗ってるんじゃないのかにゃ？", "調子に乗るんじゃないにゃ！カツオ節の匂いがしたから、たまたまついてってあげてるだけだにゃ！\n\n調子に乗ってるとアンジュはどっか行っちゃうにゃよ！","いいか、お前はアンジュの奴隷だにゃ！その事を肝に銘じつつ、奴隷らしく死ぬまでアンジュに尽くすが良いにゃ！", "まったく、人間はこれだから嫌だにゃ。自分が世界で一番偉いと思ってるにゃ。\n\n世界で一番偉いのは猫だっていうのににゃ。"],
                      ["ふう、そろそろ疲れたから家に帰るにゃ。さっさとするにゃ。", "なんだってにゃ？「まだ散歩し足りない。今日は1万歩目標だからもう少し歩きたい。」だってにゃ！？奴隷のくせに生意気言うんじゃないにゃ！", "奴隷は奴隷らしくアンジュの言う事を黙って聞いてれば良いにゃ！まったく、すぐ調子に乗るにゃ。そんなんでこの言いたい事も言えない世の中をちゃんと生き抜いて行けると思っているのかにゃ。", "よく聞くにゃ。この世の中は出る杭は打たれるし、理不尽な苦しみに溢れた恐ろしい世界にゃ。そんな自分勝手な振る舞いをしてたら周りの人間から爪弾きにされて、余計に生きづらくなって行くにゃ。和を大切にするにゃ。", "自分勝手に振る舞ってみんなに煙たがられて、あることないこと言われてうつ病になってしまった人間をこれまで何人も見てきたにゃ。", "まったく、お前はアンジュがちゃんと見ていてあげないと駄目にゃ。仕方ないにゃ。今日は大人なアンジュが折れてあげるにゃ。でも1万歩歩いたら絶対帰るんにゃよ！", "・・・ほら、そうと決まったらさっさと歩くにゃ！そうじゃないにゃ！もっと太ももを高く上げるにゃ！\nはい、イチ、ニャー、イチ、ニャー！"],
                      ["ふう、結構歩いたから喉乾いたにゃ。\n\nおい、奴隷、牛乳よこすにゃ。", "ん？今回は素早い対応だにゃ。こないだアンジュが言った言葉が効いてるのかにゃ。", "まあこないだはちょっと言い過ぎたにゃ。\nお前が心配だから厳しいアドバイスをしてあげただけにゃ。\n調子に乗ってるせいで村八分にされて夜逃げでもされたらアンジュも寂しいにゃ。", "！！\n\n勘違いするんじゃにゃいよ！アンジュにカツオ節を献上する人間がいなくなったらアンジュが困るから言ってるだけにゃ！調子に乗るんじゃないにゃ！", "やっぱり奴隷はすぐ調子に乗るから気が抜けないにゃ。\n\n仕方ないにゃ。奴隷にはアンジュが死ぬまでついてってあげるにゃ。\n感謝するんにゃよ！"]]
    let boarder_02 = [["今日はどこに向かってるのかにゃ？\(UserDefaultUtil().readUserName())。置いていかないでおくれにゃ。", "", ""],
                      ["", "", ""],
                      ["", "", ""]]
    let boarder_03 = [["", "", ""],
                      ["", "", ""],
                      ["", "", ""]]
    let boarder_04 = [["", "", ""],
                      ["", "", ""],
                      ["", "", ""]]
    let boarder_05 = [["", "", ""],
                      ["", "", ""],
                      ["", "", ""]]
    let boarder_06 = [["", "", ""],
                      ["", "", ""],
                      ["", "", ""]]
    let boarder_07 = [["", "", ""],
                      ["", "", ""],
                      ["", "", ""]]
    let boarder_08 = [["", "", ""],
                      ["", "", ""],
                      ["", "", ""]]
    let boarder_09 = [["", "", ""],
                      ["", "", ""],
                      ["", "", ""]]
    let boarder_10 = [["", "", ""],
                      ["", "", ""],
                      ["", "", ""]]
    
    switch catNumber {
    case "01":
        if (eventNumber == 0) {
            return boarder_01[0]
        } else if (eventNumber == 1) {
            return boarder_01[1]
        } else if (eventNumber == 2) {
            return boarder_01[2]
        }
    case "02":
        if (eventNumber == 0) {
            return boarder_02[0]
        } else if (eventNumber == 1) {
            return boarder_02[1]
        } else if (eventNumber == 2) {
            return boarder_02[2]
        }
    case "03":
        if (eventNumber == 0) {
            return boarder_03[0]
        } else if (eventNumber == 1) {
            return boarder_03[1]
        } else if (eventNumber == 2) {
            return boarder_03[2]
        }
    case "04":
        if (eventNumber == 0) {
            return boarder_04[0]
        } else if (eventNumber == 1) {
            return boarder_04[1]
        } else if (eventNumber == 2) {
            return boarder_04[2]
        }
    case "05":
        if (eventNumber == 0) {
            return boarder_05[0]
        } else if (eventNumber == 1) {
            return boarder_05[1]
        } else if (eventNumber == 2) {
            return boarder_05[2]
        }
    case "06":
        if (eventNumber == 0) {
            return boarder_06[0]
        } else if (eventNumber == 1) {
            return boarder_06[1]
        } else if (eventNumber == 2) {
            return boarder_06[2]
        }
    case "07":
        if (eventNumber == 0) {
            return boarder_07[0]
        } else if (eventNumber == 1) {
            return boarder_07[1]
        } else if (eventNumber == 2) {
            return boarder_07[2]
        }
    case "08":
        if (eventNumber == 0) {
            return boarder_08[0]
        } else if (eventNumber == 1) {
            return boarder_08[1]
        } else if (eventNumber == 2) {
            return boarder_08[2]
        }
    case "09":
        if (eventNumber == 0) {
            return boarder_09[0]
        } else if (eventNumber == 1) {
            return boarder_09[1]
        } else if (eventNumber == 2) {
            return boarder_09[2]
        }
    case "10":
        if (eventNumber == 0) {
            return boarder_10[0]
        } else if (eventNumber == 1) {
            return boarder_10[1]
        } else if (eventNumber == 2) {
            return boarder_10[2]
        }
    default:
        return [""]
    }
    return [""]
}
