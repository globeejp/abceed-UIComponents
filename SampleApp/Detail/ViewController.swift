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
