
import UIKit

@MainActor
class ViewController: UIViewController {

    let statusLabel = UILabel()
    let resultLabel = UILabel()

    let fetchButton = UIButton(type: .system)
    let emptyButton = UIButton(type: .system)
    let failureButton = UIButton(type: .system)
    let cancelButton = UIButton(type: .system)
    let activityIndicator = UIActivityIndicatorView(style: .medium)

    var fetchTask: Task<Void, Never>?

    enum FetchError: Error {
        case failed
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        statusLabel.text = "Ready"
        statusLabel.textAlignment = .center
        statusLabel.font = .boldSystemFont(ofSize: 22)

        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 0

        fetchButton.setTitle("Fetch Products", for: .normal)
        emptyButton.setTitle("Show Empty Result", for: .normal)
        failureButton.setTitle("Simulate Failure", for: .normal)
        cancelButton.setTitle("Cancel Task", for: .normal)

        fetchButton.addTarget(self, action: #selector(fetchSuccess), for: .touchUpInside)
        emptyButton.addTarget(self, action: #selector(fetchEmpty), for: .touchUpInside)
        failureButton.addTarget(self, action: #selector(fetchFailure), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelFetch), for: .touchUpInside)

        let stack = UIStackView(arrangedSubviews: [
            statusLabel,
            resultLabel,
            activityIndicator,
            fetchButton,
            emptyButton,
            failureButton,
            cancelButton
        ])

        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }

    // R1: Async function to fetch products
    func fetchProducts(mode: String) async throws -> [String] {
        try await Task.sleep(nanoseconds: 3_000_000_000)
        try Task.checkCancellation()

        if mode == "failure" {
            throw FetchError.failed
        }

        if mode == "empty" {
            return []
        }

        return ["Laptop", "Mobile", "Headphones"]
    }

    // R2 and R3: Create Task and handle all states
    func startFetch(mode: String) {
        fetchTask?.cancel()

        statusLabel.text = "Loading..."
        resultLabel.text = "Please wait"
        activityIndicator.startAnimating()

        fetchButton.isEnabled = false
        emptyButton.isEnabled = false
        failureButton.isEnabled = false

        fetchTask = Task {
            defer {
                activityIndicator.stopAnimating()
                fetchButton.isEnabled = true
                emptyButton.isEnabled = true
                failureButton.isEnabled = true
                fetchTask = nil
            }

            do {
                let products = try await fetchProducts(mode: mode)
                try Task.checkCancellation()

                if products.isEmpty {
                    statusLabel.text = "Empty"
                    resultLabel.text = "No products found."
                } else {
                    statusLabel.text = "Success"
                    resultLabel.text = products.joined(separator: "\n")
                }

            } catch is CancellationError {
                statusLabel.text = "Cancelled"
                resultLabel.text = "Operation was cancelled."

            } catch {
                statusLabel.text = "Failure"
                resultLabel.text = "Something went wrong."
            }
        }
    }

    @objc func fetchSuccess() {
        startFetch(mode: "success")
    }

    @objc func fetchEmpty() {
        startFetch(mode: "empty")
    }

    @objc func fetchFailure() {
        startFetch(mode: "failure")
    }

    // R4: Cancel the running Task
    @objc func cancelFetch() {
        fetchTask?.cancel()
    }
}
