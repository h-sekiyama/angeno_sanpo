import UIKit

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
    case boarder_05 = "優雅な白猫。その美貌により周りのオス猫達が日々美味しい食べ物と共に求婚しに来るほど。また期待感を残しつつ上手くあしらうのが得意で、たまに勘違いしたオスがストーカーになる。でも自分は全く悪くないと思っており、同性からは嫌われている。"
    case boarder_06 = "ロシアンブルーのメス。ツヤツヤしたグレーの毛が特徴で、この種は主人に忠実で献身的な愛情を持つ。この猫も元々は家猫だったが飼い主が高齢により亡くなってしまい保健所に引き取られたが、飼い主がまだ生きていると信じて飼い主を探すために保健所から逃げ出した。"
    case boarder_07 = "三毛猫のオス。遺伝的に三毛猫のオスはめったにいない。その為、小さい頃からずっと仲間はずれにされて来て、そのせいで素直に自分の感情を出すのが苦手。この猫が真に心を開ける日が果たしてやってくるのだろうか。"
    case boarder_08 = "シャム猫のメス。タイが原産の猫で、高貴な血筋の家系じゃないと飼うことが許されなかった時代もあったと言う選ばれし猫。この子もとても気位が高く、絶対に他の猫や人間にこびたりしない。そのため白猫がオスに色目を使っているのを面白く思ってない。"
    case boarder_09 = "マヌルヤマネコのオス。ズングリとした体型と、耳の位置が普通の猫と比べて低い位置にあるのが特徴。日本ではとても珍しい。子供の頃に日本に連れて来られたが、自分の居場所はここではないと感じて富士サファリパークから脱走した。"
    case boarder_10 = "スフィンクスのオス。とても短い産毛しか生えてないのが最大の特徴。暑いのも寒いのも苦手。実は猫専用のショッピングサイト、Nyamazonを作った猫界のカリスマ。猫の長者番付では常に上位３にゃんに入る存在。"
    
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
