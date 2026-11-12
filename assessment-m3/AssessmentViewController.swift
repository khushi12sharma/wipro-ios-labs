
import UIKit

final class AssessmentViewController: UIViewController,
                                     UITableViewDataSource,
                                     UITableViewDelegate {

    private let nameField = UITextField()
    private let emailField = UITextField()
    private let submitButton = UIButton(type: .system)

    private let statusLabel = UILabel()
    private let activityIndicator = UIActivityIndicatorView(
        style: .medium
    )

    private let tableView = UITableView()
    private let apiService = APIService()

    private var users: [User] = []

    private enum ScreenState {
        case loading
        case empty
        case failure(String)
        case loaded
    }

    private var currentState: ScreenState = .empty {
        didSet {
            updateState()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "User Dashboard"
        view.backgroundColor = .systemBackground

        setupUI()
        fetchUsers()
    }

    private func setupUI() {

        nameField.placeholder = "Enter your name"
        nameField.borderStyle = .roundedRect
        nameField.accessibilityLabel = "Name"

        emailField.placeholder = "Enter your email"
        emailField.borderStyle = .roundedRect
        emailField.keyboardType = .emailAddress
        emailField.autocapitalizationType = .none
        emailField.accessibilityLabel = "Email"

        submitButton.setTitle("Submit", for: .normal)
        submitButton.backgroundColor = .systemBlue
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.cornerRadius = 8
        submitButton.addTarget(
            self,
            action: #selector(submitForm),
            for: .touchUpInside
        )

        statusLabel.textAlignment = .center
        statusLabel.numberOfLines = 0

        activityIndicator.hidesWhenStopped = true

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "UserCell"
        )

        let formStack = UIStackView(arrangedSubviews: [
            nameField,
            emailField,
            submitButton
        ])

        formStack.axis = .vertical
        formStack.spacing = 12
        formStack.translatesAutoresizingMaskIntoConstraints = false

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(formStack)
        view.addSubview(activityIndicator)
        view.addSubview(statusLabel)
        view.addSubview(tableView)

        NSLayoutConstraint.activate([

            formStack.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20
            ),
            formStack.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            formStack.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),

            submitButton.heightAnchor.constraint(
                equalToConstant: 44
            ),

            activityIndicator.topAnchor.constraint(
                equalTo: formStack.bottomAnchor,
                constant: 20
            ),
            activityIndicator.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),

            statusLabel.topAnchor.constraint(
                equalTo: activityIndicator.bottomAnchor,
                constant: 10
            ),
            statusLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            statusLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),

            tableView.topAnchor.constraint(
                equalTo: statusLabel.bottomAnchor,
                constant: 10
            ),
            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            )
        ])
    }

    @objc private func submitForm() {

        let name = nameField.text ?? ""
        let email = emailField.text ?? ""

        guard FormValidator.validateForm(
            name: name,
            email: email
        ) else {
            showAlert(
                message: "Please enter a valid name and email."
            )
            return
        }

        showAlert(
            message: "Form submitted successfully!"
        )
    }

    private func fetchUsers() {

        currentState = .loading

        Task {
            do {
                let fetchedUsers = try await apiService.fetchUsers()

                await MainActor.run {
                    users = fetchedUsers

                    if users.isEmpty {
                        currentState = .empty
                    } else {
                        currentState = .loaded
                    }

                    tableView.reloadData()
                }

            } catch {
                await MainActor.run {
                    currentState = .failure(
                        "Unable to load users. Please try again."
                    )
                }
            }
        }
    }

    private func updateState() {

        switch currentState {

        case .loading:
            activityIndicator.startAnimating()
            statusLabel.text = "Loading users..."
            tableView.isHidden = true

        case .empty:
            activityIndicator.stopAnimating()
            statusLabel.text = "No users found."
            tableView.isHidden = true

        case .failure(let message):
            activityIndicator.stopAnimating()
            statusLabel.text = message + "\nPull down or reopen the screen to retry."
            tableView.isHidden = true

        case .loaded:
            activityIndicator.stopAnimating()
            statusLabel.text = "Users loaded successfully."
            tableView.isHidden = false
        }
    }

    private func showAlert(message: String) {

        let alert = UIAlertController(
            title: "Information",
            message: message,
            preferredStyle: .alert
        )

        alert.addAction(
            UIAlertAction(title: "OK", style: .default)
        )

        present(alert, animated: true)
    }

    // MARK: - Table View

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return users.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "UserCell",
            for: indexPath
        )

        let user = users[indexPath.row]

        var content = cell.defaultContentConfiguration()
        content.text = user.fullName
        content.secondaryText = user.email

        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {

        tableView.deselectRow(
            at: indexPath,
            animated: true
        )

        let selectedUser = users[indexPath.row]

        let detailVC = UserDetailViewController(
            user: selectedUser
        )

        navigationController?.pushViewController(
            detailVC,
            animated: true
        )
    }
}
