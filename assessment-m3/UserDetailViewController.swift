
import UIKit

final class UserDetailViewController: UIViewController {

    private let user: User

    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let idLabel = UILabel()
    private let imageLabel = UILabel()

    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "User Details"
        view.backgroundColor = .systemBackground

        setupUI()
    }

    private func setupUI() {

        nameLabel.text = "Name: \(user.fullName)"
        emailLabel.text = "Email: \(user.email)"
        idLabel.text = "User ID: \(user.id)"
        imageLabel.text = "Profile Image URL: \(user.image)"

        let labels = [
            nameLabel,
            emailLabel,
            idLabel,
            imageLabel
        ]

        labels.forEach {
            $0.numberOfLines = 0
            $0.font = .systemFont(ofSize: 16)
        }

        let stack = UIStackView(arrangedSubviews: labels)

        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 30
            ),
            stack.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            stack.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            )
        ])
    }
}
