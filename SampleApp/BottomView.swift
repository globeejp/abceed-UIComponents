import UIKit

final class BottomView: UIView {
    var onTap: (() -> ())?

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureLayout()
        configureUserEvent()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func configureLayout() {
        backgroundColor = UIColor(named: "MyYellow")
    }

    private func configureUserEvent() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
    }

    @objc private func tap() { onTap?() }
}
