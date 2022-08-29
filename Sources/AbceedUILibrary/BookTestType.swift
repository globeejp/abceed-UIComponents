import UIKit

public enum BookTestType: Int, Comparable, CaseIterable {

    /// アプリ学習
    case contents = 0

    /// テスト
    case mockExamTest

    /// 音声
    case sound

    /// S&W
    case sw

    /// 単語一覧
    case vocabs

    /// マークシート
    case marksheet

    /// 学習記録の手入力
    case handRecord

    public static func < (lhs: BookTestType, rhs: BookTestType) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

    public var titleText: String {
        switch self {
        case .contents: return "アプリ学習"
        case .mockExamTest: return "テスト"
        case .sound: return "音声(無料)"
        case .sw: return "SWトレ"
        case .vocabs: return "単語一覧"
        case .marksheet: return "マークシート"
        case .handRecord: return "学習記録"
        }
    }

    public var iconImage: UIImage {
        switch self {

        case .marksheet:
            return .abc.iconStudyMarksheet

        case .sound:
            return .abc.iconStudyAudio

        case .contents:
            return .abc.iconStudyQuiz

        case .handRecord:
            return .abc.iconStudyRecord

        case .sw:
            return .abc.iconSW

        case .vocabs:
            return .abc.iconVocab

        case .mockExamTest:
            return .abc.iconStudyTest
        }
    }

}
