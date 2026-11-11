
import UIKit

class ProfileViewController: UIViewController {

    let nameField = UITextField()
    let emailField = UITextField()
    let courseField = UITextField()
    let submitButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Profile Form"

        nameField.placeholder = "Enter your name"
        nameField.borderStyle = .roundedRect
        nameField.autocapitalizationType = .words
        nameField.textContentType = .name
        nameField.accessibilityLabel = "Name"

        emailField.placeholder = "Enter your email"
        emailField.borderStyle = .roundedRect
        emailField.keyboardType = .emailAddress
        emailField.autocapitalizationType = .none
        emailField.textContentType = .emailAddress
        emailField.accessibilityLabel = "Email"

        courseField.placeholder = "Enter your course"
        courseField.borderStyle = .roundedRect
        courseField.textContentType = .none
        courseField.accessibilityLabel = "Course"

        submitButton.setTitle("Submit", for: .normal)
        submitButton.backgroundColor = .systemBlue
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.cornerRadius = 8
        submitButton.addTarget(self, action: #selector(submitForm), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [
            nameField, emailField, courseField, submitButton
        ])

        stackView.axis = .vertical
        stackView.spacing = 18
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            nameField.heightAnchor.constraint(equalToConstant: 48),
            emailField.heightAnchor.constraint(equalToConstant: 48),
            courseField.heightAnchor.constraint(equalToConstant: 48),
            submitButton.heightAnchor.constraint(equalToConstant: 48)
        ])

        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc func submitForm() {
        dismissKeyboard()

        guard let name = nameField.text, !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            showError("Please enter your name")
            return
        }

        guard let email = emailField.text,
              email.range(of: #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#, options: .regularExpression) != nil else {
            showError("Please enter a valid email")
            return
        }

        guard let course = courseField.text,
              !course.trimmingCharacters(in: .whitespaces).isEmpty else {
            showError("Please enter your course")
            return
        }

        let alert = UIAlertController(
            title: "Success",
            message: "Profile submitted successfully for \(name)!",
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    func showError(_ message: String) {
        let alert = UIAlertController(
            title: "Validation Error",
            message: message,
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
