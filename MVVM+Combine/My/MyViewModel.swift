import Combine

final class MyViewModel {

    let counterTitleSubject = PassthroughSubject<String, Never>()
    let incrementActionSubject = PassthroughSubject<Void, Never>()
    let decrementActionSubject = PassthroughSubject<Void, Never>()
    let multiplyActionSubject = PassthroughSubject<Void, Never>()

    private var counter = 0
    private var cancellable: Set<AnyCancellable> = []

    init() {
        incrementBindings()
        decrementBindings()
        multiplyBindings()
    }

    func incrementBindings() { incrementActionSubject.sink(receiveValue: { [weak self] in
        self?.counter += 1
        self?.counterTitleSubject.send("Counter \(self?.counter ?? 0)")
    })
    .store(in: &cancellable)
    }

    func decrementBindings() { decrementActionSubject.sink(receiveValue: { [weak self] in
        self?.counter -= 1
        self?.counterTitleSubject.send("Counter \(self?.counter ?? 0)")
    })
    .store(in: &cancellable)
    }

    func multiplyBindings() { multiplyActionSubject.sink(receiveValue: { [weak self] in
        self?.counter *= 2
        self?.counterTitleSubject.send("Counter \(self?.counter ?? 0)")
    })
    .store(in: &cancellable)
    }
}
