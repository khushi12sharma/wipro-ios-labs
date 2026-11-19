
import UIKit

class UIKitImplementation: UIViewController {

    let titleLabel = UILabel()
    let nameTextField = UITextField()
    let submitButton = UIButton(type: .system)
    let resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // Title Label
        titleLabel.text = "Student Greeting App"
        titleLabel.font = .boldSystemFont(ofSize: 26)
        titleLabel.textAlignment = .center

        // Text Field
        nameTextField.placeholder = "Enter your name"
        nameTextField.borderStyle = .roundedRect

        // Submit Button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.backgroundColor = .systemBlue
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.cornerRadius = 8

        // Result Label
        resultLabel.text = "Your result will appear here"
        resultLabel.textAlignment = .center
        resultLabel.font = .systemFont(ofSize: 18)

        // Button Action
        submitButton.addTarget(
            self,
            action: #selector(submitButtonTapped),
            for: .touchUpInside
        )

        setupLayout()
    }

    func setupLayout() {

        let stackView = UIStackView(
            arrangedSubviews: [
                titleLabel,
                nameTextField,
                submitButton,
                resultLabel
            ]
        )

        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            stackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            stackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            )
        ])
    }

    @objc func submitButtonTapped() {

        let name = nameTextField.text ?? ""

        if name.isEmpty {
            resultLabel.text = "Please enter your name"
        } else {
            resultLabel.text = "Hello, \(name)!"
        }
    }
}
