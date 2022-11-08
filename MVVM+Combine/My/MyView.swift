import Combine
import EasyAutolayout
import UIKit

class MyView: UIViewController {

    private let counterLabel = UILabel()
    private let incrementButton = UIButton()
    private let decrementButton = UIButton()
    private let multiplyButton = UIButton()
    private var cancellable: Set<AnyCancellable> = []
    var viewModel: MyViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        configureBindings()
    }

    private func configureBindings() {
        viewModel.counterTitleSubject
            .assign(to: \.text!, on: counterLabel)
            .store(in: &cancellable)
    }

    private func configureUI() {
        view.addSubview(counterLabel)
        counterLabel.pin
            .center(in: view)
            .leading(to: view, offset: 21)
            .trailing(to: view, offset: 21)
        counterLabel.text = "Counter  0"
        counterLabel.textAlignment = .center

        view.addSubview(incrementButton)
        incrementButton.setTitleColor(.red, for: .normal)
        incrementButton.setTitle("Increment(+1)", for: .normal)
        incrementButton.pin
            .below(of: counterLabel, offset: 40)
            .centerX(in: view)

        incrementButton.addTarget(self, action: #selector(incrementButtonDidTapped), for: .touchUpInside)

        view.addSubview(decrementButton)
        decrementButton.setTitleColor(.red, for: .normal)
        decrementButton.setTitle("Decrement(-1)", for: .normal)
        decrementButton.pin
            .below(of: incrementButton, offset: 30)
            .centerX(in: view)

        decrementButton.addTarget(self, action: #selector(decrementButtonDidTapped), for: .touchUpInside)

        view.addSubview(multiplyButton)
        multiplyButton.setTitleColor(.red, for: .normal)
        multiplyButton.setTitle("Multiply(X2)", for: .normal)
        multiplyButton.pin
            .below(of: decrementButton, offset: 30)
            .centerX(in: view)

        multiplyButton.addTarget(self, action: #selector(multiplyButtonDidTapped), for: .touchUpInside)
    }

    @objc private func incrementButtonDidTapped() {
        viewModel.incrementActionSubject.send()
    }

    @objc private func decrementButtonDidTapped() {
        viewModel.decrementActionSubject.send()
    }

    @objc private func multiplyButtonDidTapped() {
        viewModel.multiplyActionSubject.send()
    }
}
