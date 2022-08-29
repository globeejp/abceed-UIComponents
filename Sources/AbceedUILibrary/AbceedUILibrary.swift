import UIKit

extension UIView {

    /// `constrainSubview`などコードレイアウト系の関数の引数で使用されている。
    /// 主にセーフエリアに対する制約にするかどうかの指定に用いられる。
    public enum Edge {
        case top, bottom, leading, trailing
    }

    /// subviewを四隅に貼り付ける。
    public func constrainSubview(
        _ view: UIView,
        top: CGFloat = 0,
        bottom: CGFloat = 0,
        leading: CGFloat = 0,
        trailing: CGFloat = 0,
        againstSafeAreaOf edges: Set<Edge> = []
    ) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(
                equalTo: edges.contains(.top) ? safeAreaLayoutGuide.topAnchor : topAnchor,
                constant: top
            ),
            view.bottomAnchor.constraint(
                equalTo: edges.contains(.bottom) ? safeAreaLayoutGuide.bottomAnchor : bottomAnchor,
                constant: -bottom
            ),
            view.leadingAnchor.constraint(
                equalTo: edges.contains(.leading) ? safeAreaLayoutGuide.leadingAnchor : leadingAnchor,
                constant: leading
            ),
            view.trailingAnchor.constraint(
                equalTo: edges.contains(.trailing) ? safeAreaLayoutGuide.trailingAnchor : trailingAnchor,
                constant: -trailing
            ),
        ])

    }

    /// subviewを四隅に貼り付ける。
    public func constrainSubview(
        _ view: UIView,
        horizontal: CGFloat = 0,
        vertical: CGFloat = 0,
        againstSafeAreaOf edges: Set<Edge> = []
    ) {
        constrainSubview(
            view,
            top: vertical,
            bottom: vertical,
            leading: horizontal,
            trailing: horizontal,
            againstSafeAreaOf: edges
        )
    }

    /// StackView内の細かいレイアウト調整に使う空っぽのビュー。
    public static func spacer(width: CGFloat? = nil, height: CGFloat? = nil, color: UIColor = .clear) -> UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false

        if let width = width {
            v.widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height = height {
            v.heightAnchor.constraint(equalToConstant: height).isActive = true
        }

        v.backgroundColor = color
        return v
    }

}

extension NSLayoutConstraint {
    public func priority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
}
