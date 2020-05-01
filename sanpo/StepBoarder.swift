public enum StepBoarder: Int {
    case boarder_01 = 100
    case boarder_02 = 500
    case boarder_03 = 1000
    case boarder_04 = 5000
    case boarder_05 = 15000
    case boarder_06 = 25000
    case boarder_07 = 40000
    case boarder_08 = 60000
    case boarder_09 = 80000
    case boarder_10 = 100000
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
    case boarder_05 = "優雅な白猫。貴族の様な優美さを漂わせた気品あふれるメス。気位の高さから、知らない人間からもらったエサは絶対に食べない。でもその美貌の虜になったオス猫たちが毎日美味しい食べ物を貢いでくれるので大丈夫。"
    case boarder_06 = "ロシアンブルーのメス猫。ツヤツヤしたグレーの毛が特徴。ロシアンブルーは主人に忠実で自分が飼い主と認めた人間に対しては献身的な愛情を持つ子が多い。この猫も元々は家猫だったが飼い主が高齢により亡くなってしまい保健所に引き取られたが、飼い主がまだ生きていると信じて飼い主を探すために保健所を脱走した。"
    case boarder_07 = "三毛猫のメス。遺伝的に三毛猫のオスはめったにいないと言うのは豆知識。そのため昔からオスの三毛猫は福を呼ぶと信じられており、三毛猫を船に乗せると船が遭難しないと信じられていたとか。また日本の南極観測隊もその福にあやかって極寒の南極を三毛猫と過ごした。"
    case boarder_08 = "シャム猫のメス。タイが原産の猫で、高貴な血筋の家系じゃないと飼うことが許されなかった時代もあったと言う選ばれし猫。この子もとても気位が高く、絶対に他の猫や人間にこびたりしない。近所の白猫がオスに色目を使っているのを面白く思ってない。"
    case boarder_09 = "マヌルヤマネコのオス。ズングリとした体型と、耳の位置が普通の猫と比べて低い位置にあるのが特徴。日本ではとても珍しい猫。サファリパークから脱走した。"
    case boarder_10 = "スフィンクスのメス猫。とても短い産毛しか生えてないのが最大の特徴。暑いのも寒いのも苦手。実は猫専用のショッピングサイト、Nyamazonを作った猫界のカリスマ。猫の長者番付では常に上位３にゃんに入る存在。"
    
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
