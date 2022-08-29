import AbceedUILibrary
import UIKit

final class ViewController: UIViewController {

    private let baseStackView: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.distribution = .fillEqually
        vStack.alignment = .fill
        vStack.spacing = 0
        return vStack
    }()

    private let topView = TopView()
    private let bottomView = BottomView()
    private var preWidth: CGFloat?

    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureLayout()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let width = view.frame.width

        if preWidth != width, width > 0 {
            configureAdaptive()
        }

        preWidth = width
    }

    // MARK: Private

    private func configureLayout() {
        view.backgroundColor = UIColor(named: "monotone8")

        [topView, bottomView]
            .forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                baseStackView.addArrangedSubview($0)
            }

        topView.configure(.kinfure())

        view.constrainSubview(baseStackView)
    }

    private func configureAdaptive() {
        baseStackView.axis = isLandscape ? .horizontal : .vertical
    }

    private var isLandscape: Bool {
        view.frame.width > view.frame.height
    }
}

extension Book {

    fileprivate static func kinfure() -> Book {
        Book(
            author: "TEX 加藤",
            id_book: "tokyu_kinhure_new",
            img_url: "https://d3grtcc7imzgqe.cloudfront.net/img/book_small/tokyu_kinhure_new.jpg",
            name_book: "TOEIC L&R TEST 出る単特急 金のフレーズ",
            publisher: "朝日新聞出版"
        )
    }
}
