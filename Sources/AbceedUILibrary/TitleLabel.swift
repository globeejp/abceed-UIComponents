import UIKit

/// 角丸背景付きのラベル
public final class TitleLabel: UIView {
    private let label = UI.label(12, weight: .light, color: .abc.monotone2)
    var onTap: (() -> ())?

    public init(_ title: String) {
        super.init(frame: .zero)

        label.text = title

        configureLayout()
        configureUserEvent()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func configureLayout() {
        layer.cornerRadius = 5
        backgroundColor = .abc.monotone6

        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 40),
            heightAnchor.constraint(equalToConstant: 18),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    private func configureUserEvent() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
    }

    @objc private func tap() { onTap?() }
}
