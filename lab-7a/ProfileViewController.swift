
import UIKit

class ProfileViewController: UIViewController {

    let profileView = ProfileFormView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Profile Form"

        profileView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileView)

        NSLayoutConstraint.activate([
            profileView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 20
            ),
            profileView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -20
            ),
            profileView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            )
        ])

        profileView.submitButton.addTarget(
            self,
            action: #selector(submitForm),
            for: .touchUpInside
        )

        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc func submitForm() {
        dismissKeyboard()

        let name = profileView.nameField.text ?? ""
        let email = profileView.emailField.text ?? ""
        let course = profileView.courseField.text ?? ""

        if !ProfileValidator.validateName(name) {
            showError("Please enter your name")
            return
        }

        if !ProfileValidator.validateEmail(email) {
            showError("Please enter a valid email")
            return
        }

        if !ProfileValidator.validateCourse(course) {
            showError("Please enter your course")
            return
        }

        let alert = UIAlertController(
            title: "Success",
            message: "Profile submitted successfully!",
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
