
import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        LifecycleLogger.log("Second Screen: viewDidLoad")

        title = "Second Screen"
        view.backgroundColor = .systemBackground

        let label = UILabel()
        label.text = "Welcome to Second Screen"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)

        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            label.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            )
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        LifecycleLogger.log("Second Screen: viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        LifecycleLogger.log("Second Screen: viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        LifecycleLogger.log("Second Screen: viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        LifecycleLogger.log("Second Screen: viewDidDisappear")
    }
}
