import SwiftUI
import UIKit

/// アイコンとか数字（３）が左側にあって、右側のTextViewは右側内で折り返すレイアウト。
/// 引数で渡される左側要素はセルフサイジングしている前提。
/// 左側要素のcenterYと右側テキストの1行目で制約が貼られる形。
/// 左側要素の方が高い想定なのであまり小さいと崩れるかも。
public final class BulletTextLayout: UIView {

    /// - parameter leftElement: アイコンやテキストビュー（アイコン以外だと崩れるかも）
    /// - parameter spacing: 左と右の間のマージン
    /// - parameter rightElement: TextView,Labelと型が定まらないためUIViewを受け取る。
    /// - parameter rightTextFontSize: テキストを表示する前提なのでそのフォントサイズを渡す。
    ///     これによって1行目のcenterY制約を調整する。
    public init(
        _ leftElement: UIView,
        spacing: CGFloat,
        rightElement: UIView,
        rightTextFontSize: CGFloat
    ) {
        super.init(frame: .zero)

        [leftElement, rightElement].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.layoutIfNeeded()
            $0.sizeToFit()
            addSubview($0)
        }

        NSLayoutConstraint.activate([
            leftElement.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftElement.topAnchor.constraint(equalTo: topAnchor),
            rightElement.leadingAnchor.constraint(equalTo: leftElement.trailingAnchor, constant: spacing),
            rightElement.trailingAnchor.constraint(equalTo: trailingAnchor),
            rightElement.topAnchor.constraint(equalTo: leftElement.centerYAnchor, constant: -(rightTextFontSize * 1.2) / 2),
            leftElement.bottomAnchor.constraint(equalTo: bottomAnchor).priority(.defaultLow),
            rightElement.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

    }

    public required init?(coder: NSCoder) { fatalError() }
}

private struct BulletTextLayoutPreviewView1: UIViewRepresentable {

    func makeUIView(context: Context) -> PreviewView {
        let textview = UILabel()
        let fontSize: CGFloat = 14
        textview.font = .monospacedDigitSystemFont(ofSize: fontSize, weight: .regular)
        textview.text = "We can do it by ourself no other way with smoke sermon."
        textview.numberOfLines = 0

        return PreviewView(textview, rightTextFontSize: fontSize)
    }

    func updateUIView(_ uiView: PreviewView, context: Context) {
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}

private struct BulletTextLayoutPreviewView2: UIViewRepresentable {

    func makeUIView(context: Context) -> PreviewView {
        let textview = UILabel()
        let fontSize: CGFloat = 22
        textview.font = .monospacedDigitSystemFont(ofSize: fontSize, weight: .bold)
        textview.text = "We can do it by ourself no other way with smoke sermon."
        textview.numberOfLines = 0

        return PreviewView(textview, rightTextFontSize: fontSize)
    }

    func updateUIView(_ uiView: PreviewView, context: Context) {
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}

private struct BulletTextLayoutPreviewView3: UIViewRepresentable {

    func makeUIView(context: Context) -> PreviewView {
        let textview = UILabel()
        let fontSize: CGFloat = 22
        textview.font = .monospacedDigitSystemFont(ofSize: fontSize, weight: .bold)
        textview.text = "We can do it."
        textview.numberOfLines = 0

        return PreviewView(textview, rightTextFontSize: fontSize)
    }

    func updateUIView(_ uiView: PreviewView, context: Context) {
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}

private struct BulletTextLayoutPreviewView4: UIViewRepresentable {

    func makeUIView(context: Context) -> PreviewView {
        let label = UILabel()
        let fontSize: CGFloat = 22
        label.font = .monospacedDigitSystemFont(ofSize: fontSize, weight: .bold)
        label.text = "We can do it."
        label.numberOfLines = 0

        return PreviewView(label, rightTextFontSize: fontSize)
    }

    func updateUIView(_ uiView: PreviewView, context: Context) {
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}

private final class PreviewView: UIStackView {

    init(_ rightElement: UIView, rightTextFontSize: CGFloat) {
        super.init(frame: .zero)

        axis = .vertical
        distribution = .fill
        alignment = .fill
        spacing = 0

        let icon: UIView = {
            let imageView = UIView()
            imageView.backgroundColor = .systemGreen
            imageView.layer.cornerRadius = 4
            imageView.widthAnchor.constraint(equalToConstant: 22).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 22).isActive = true
            return imageView
        }()

        rightElement.backgroundColor = .systemYellow

        let BulletTextLayout = BulletTextLayout(
            icon,
            spacing: 10,
            rightElement: rightElement,
            rightTextFontSize: rightTextFontSize
        )

        BulletTextLayout.backgroundColor = .systemRed
        BulletTextLayout.translatesAutoresizingMaskIntoConstraints = false

        addArrangedSubview(BulletTextLayout)
        addArrangedSubview(.spacer())
    }

    required init(coder: NSCoder) { fatalError() }
}

struct BulletTextLayout_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BulletTextLayoutPreviewView3()
            BulletTextLayoutPreviewView4()
            BulletTextLayoutPreviewView1()
            BulletTextLayoutPreviewView2()
        }
        .previewLayout(.sizeThatFits)
    }
}
