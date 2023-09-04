import Combine

final class ListViewModel: ObservableObject {
    enum Transition {
        case detail(Int)
    }

    var transition: AnyPublisher<Transition, Never> {
        transitionSubject.eraseToAnyPublisher()
    }

    private let transitionSubject = PassthroughSubject<Transition, Never>()

    func onTap(at index: Int) {
        transitionSubject.send(.detail(index))
    }
}
