
import UIKit

final class SettingsViewController: UIViewController {

    private let nameField = UITextField()
    private let notificationSwitch = UISwitch()
    private let themeControl = UISegmentedControl(items: ["Light", "Dark"])
    private let fontSlider = UISlider()
    private let fontValueLabel = UILabel()
    private let summaryView = SettingsSummaryView()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        setupUI()
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
            nameLabel, nameField,
            notificationLabel, notificationSwitch,
            themeLabel, themeControl,
            fontValueLabel, fontSlider,
            summaryView
        ])

        stack.axis = .vertical
        stack.spacing = 14
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20
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
}
