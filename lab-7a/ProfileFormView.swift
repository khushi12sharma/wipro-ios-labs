
import UIKit

class ProfileFormView: UIView {

    let nameField = UITextField()
    let emailField = UITextField()
    let courseField = UITextField()
    let submitButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupForm()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupForm()
    }

    private func setupForm() {

        backgroundColor = .systemBackground

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
        courseField.accessibilityLabel = "Course"

        submitButton.setTitle("Submit", for: .normal)
        submitButton.backgroundColor = .systemBlue
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.cornerRadius = 8
        submitButton.accessibilityLabel = "Submit Profile"

        let stack = UIStackView(arrangedSubviews: [
            nameField,
            emailField,
            courseField,
            submitButton
        ])

        stack.axis = .vertical
        stack.spacing = 18
        stack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stack)

        NSLayoutConstraint.activate([

            stack.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 20
            ),

            stack.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -20
            ),

            stack.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 20
            ),

            stack.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -20
            ),

            nameField.heightAnchor.constraint(equalToConstant: 48),
            emailField.heightAnchor.constraint(equalToConstant: 48),
            courseField.heightAnchor.constraint(equalToConstant: 48),
            submitButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
