import UIKit

final class TopView: UIView {
    var onTap: (() -> ())?

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureLayout()
        configureUserEvent()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func configureLayout() {
        backgroundColor = UIColor(named: "MyBlue")
    }

    private func configureUserEvent() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
    }

    @objc private func tap() { onTap?() }
}
