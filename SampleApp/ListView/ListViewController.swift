import AbceedUILibrary
import Combine
import SwiftUI
import UIKit

final class ListViewController: UIViewController {

    private let viewModel = ListViewModel()
    private var cancellables: Set<AnyCancellable> = []

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()

        let listView = ListView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: listView)
        let hostingView = hostingController.view!
        addChild(hostingController)
        view.constrainSubview(hostingView)
        hostingController.didMove(toParent: self)

        viewModel.transition.receive(on: DispatchQueue.main).sink(receiveValue: { [weak self] transition in
            let vc = ViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        })
        .store(in: &cancellables)
    }
}
