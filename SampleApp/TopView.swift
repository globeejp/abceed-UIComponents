import AbceedUILibrary
import UIKit

final class TopView: UIView {

    private let author: BulletTextLayout
    private let authorValueLabel: UILabel

    override init(frame: CGRect) {

        let fontSize: CGFloat = 14

        authorValueLabel = UI.label(fontSize, weight: .light, color: .abc.monotone2)

        author = BulletTextLayout(
            TitleLabel("著者"),
            spacing: 5,
            rightElement: authorValueLabel,
            rightTextFontSize: fontSize
        )

        super.init(frame: frame)

        configureLayout()
    }

    required init?(coder: NSCoder) { fatalError() }

    func configure(_ book: Book) {
        authorValueLabel.text = book.author
    }

    private func configureLayout() {
        backgroundColor = .abc.monotone8

        authorValueLabel.numberOfLines = 0
        author.translatesAutoresizingMaskIntoConstraints = false

        addSubview(author)

        NSLayoutConstraint.activate([
            author.centerXAnchor.constraint(equalTo: centerXAnchor),
            author.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
