import UIKit

final class BottomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureLayout()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func configureLayout() {
        backgroundColor = UIColor(named: "MyYellow")
    }
}
