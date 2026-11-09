import UIKit

class ViewController: UIViewController {

    let statusLabel = UILabel()
    let startButton = UIButton(type: .system)
    let activityIndicator = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupUI()
        logEvent("App loaded")
    }

    func setupUI() {

        statusLabel.text = "Ready to start"
        statusLabel.textAlignment = .center
        statusLabel.frame = CGRect(x: 30, y: 200, width: 300, height: 50)

        startButton.setTitle("Start Operation", for: .normal)
        startButton.frame = CGRect(x: 80, y: 280, width: 200, height: 50)
        startButton.addTarget(
            self,
            action: #selector(startOperation),
            for: .touchUpInside
        )

        activityIndicator.center = CGPoint(x: 195, y: 380)

        view.addSubview(statusLabel)
        view.addSubview(startButton)
        view.addSubview(activityIndicator)
    }

    func logEvent(_ message: String) {
        print("\(message) | Main Thread: \(Thread.isMainThread)")
    }

    @objc func startOperation() {

        startButton.isEnabled = false
        activityIndicator.startAnimating()
        statusLabel.text = "Loading..."

        logEvent("Operation started")

        DispatchQueue.global(qos: .userInitiated).async {

            self.logEvent("Background work started")

            // Simulate slow operation
            DispatchQueue.global().asyncAfter(
                deadline: .now() + 3
            ) {

                let result = "Task completed successfully!"

                self.logEvent("Background work completed")

                DispatchQueue.main.async {

                    self.statusLabel.text = result
                    self.activityIndicator.stopAnimating()
                    self.startButton.isEnabled = true

                    self.logEvent("UI updated on main thread")
                }
            }
        }
    }
}
