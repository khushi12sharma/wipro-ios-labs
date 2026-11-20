
import UIKit

class FirstViewController: UIViewController {

    private let statusLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        LifecycleLogger.log("First Screen: viewDidLoad")

        title = "First Screen"
        view.backgroundColor = .systemBackground

        statusLabel.text = "Welcome to First Screen"
        statusLabel.textAlignment = .center
        statusLabel.font = .systemFont(ofSize: 20)

        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Go to Second Screen", for: .normal)
        nextButton.addTarget(
            self,
            action: #selector(openSecondScreen),
            for: .touchUpInside
        )

        let stack = UIStackView(
            arrangedSubviews: [statusLabel, nextButton]
        )

        stack.axis = .vertical
        stack.spacing = 25
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            stack.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            )
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        LifecycleLogger.log("First Screen: viewWillAppear")
        refreshScreen()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        LifecycleLogger.log("First Screen: viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        LifecycleLogger.log("First Screen: viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        LifecycleLogger.log("First Screen: viewDidDisappear")
    }

    private func refreshScreen() {
        statusLabel.text = "Screen refreshed: \(Date())"
        LifecycleLogger.log("First Screen: Lightweight refresh")
    }

    @objc private func openSecondScreen() {
        let secondVC = SecondViewController()

        navigationController?.pushViewController(
            secondVC,
            animated: true
        )
    }
}
