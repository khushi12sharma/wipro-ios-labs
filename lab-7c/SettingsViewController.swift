
import UIKit

final class SettingsViewController: UIViewController {

    private let nameField = UITextField()
    private let notificationSwitch = UISwitch()
    private let themeControl = UISegmentedControl(items: ["Light", "Dark"])
    private let fontSlider = UISlider()
    private let fontValueLabel = UILabel()

    private let summaryView = SettingsSummaryView()
    private let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")

        setupUI()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillChangeFrame),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )

        updateSummary()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        updateSummary()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func setupUI() {
        title = "Settings Demo"
        view.backgroundColor = .systemBackground

        nameField.placeholder = "Enter your name"
        nameField.borderStyle = .roundedRect
        nameField.accessibilityLabel = "Name"

        notificationSwitch.isOn = true
        notificationSwitch.accessibilityLabel = "Notifications"

        themeControl.selectedSegmentIndex = 0
        themeControl.accessibilityLabel = "Theme"

        fontSlider.minimumValue = 12
        fontSlider.maximumValue = 30
        fontSlider.value = 18
        fontSlider.accessibilityLabel = "Font size"

        fontValueLabel.text = "Font Size: 18"

        let nameLabel = UILabel()
        nameLabel.text = "Name"

        let notificationLabel = UILabel()
        notificationLabel.text = "Notifications"

        let themeLabel = UILabel()
        themeLabel.text = "Theme"

        let stack = UIStackView(arrangedSubviews: [
            nameLabel,
            nameField,
            notificationLabel,
            notificationSwitch,
            themeLabel,
            themeControl,
            fontValueLabel,
            fontSlider,
            summaryView
        ])

        stack.axis = .vertical
        stack.spacing = 14
        stack.translatesAutoresizingMaskIntoConstraints = false

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(stack)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            scrollView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            scrollView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            scrollView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),

            stack.topAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.topAnchor,
                constant: 20
            ),
            stack.leadingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                constant: 20
            ),
            stack.trailingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.trailingAnchor,
                constant: -20
            ),
            stack.bottomAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.bottomAnchor,
                constant: -20
            ),
            stack.widthAnchor.constraint(
                equalTo: scrollView.frameLayoutGuide.widthAnchor,
                constant: -40
            )
        ])

        nameField.addTarget(
            self,
            action: #selector(controlChanged),
            for: .editingChanged
        )

        notificationSwitch.addTarget(
            self,
            action: #selector(controlChanged),
            for: .valueChanged
        )

        themeControl.addTarget(
            self,
            action: #selector(controlChanged),
            for: .valueChanged
        )

        fontSlider.addTarget(
            self,
            action: #selector(controlChanged),
            for: .valueChanged
        )

        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )

        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func controlChanged() {
        fontValueLabel.text = "Font Size: \(Int(fontSlider.value))"
        updateSummary()
    }

    private func updateSummary() {
        let theme = themeControl.selectedSegmentIndex == 0
            ? "Light" : "Dark"

        summaryView.updateSummary(
            name: nameField.text ?? "",
            notifications: notificationSwitch.isOn,
            theme: theme,
            fontSize: fontSlider.value
        )
    }

    @objc private func keyboardWillChangeFrame(
        notification: Notification
    ) {
        guard
            let keyboardFrame = notification.userInfo?[
                UIResponder.keyboardFrameEndUserInfoKey
            ] as? CGRect
        else {
            return
        }

        let convertedFrame = scrollView.convert(
            keyboardFrame,
            from: nil
        )

        let overlap = max(
            0,
            scrollView.bounds.maxY - convertedFrame.minY
        )

        scrollView.contentInset.bottom = overlap
        scrollView.scrollIndicatorInsets.bottom = overlap
    }

    @objc private func keyboardWillHide(
        notification: Notification
    ) {
        scrollView.contentInset.bottom = 0
        scrollView.scrollIndicatorInsets.bottom = 0
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
