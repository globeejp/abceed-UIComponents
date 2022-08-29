import AbceedUILibrary
import UIKit

final class TopView: UIView {

    private let author: BulletTextView

    var onTap: (() -> Void)?

    override init(frame: CGRect) {
        let fontSize: CGFloat = 14
        let label = UI.label(fontSize, weight: .light, color: .abc.monotone2)
        label.numberOfLines = 0
        label.text = "ヒロ前田、テッド寺倉、ロス・タロック"
        author = BulletTextView(TitleLabel("著者"), spacing: 5, rightElement: label, rightTextFontSize: fontSize)

        super.init(frame: frame)

        configureLayout()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func configureLayout() {
        backgroundColor = .abc.monotone8
        addSubview(author)
        author.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            author.centerXAnchor.constraint(equalTo: centerXAnchor),
            author.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
