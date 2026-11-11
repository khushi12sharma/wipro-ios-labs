
import UIKit

final class SettingsSummaryView: UIView {

    private let summaryLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 12

        summaryLabel.numberOfLines = 0
        summaryLabel.text = "Your settings will appear here."
        summaryLabel.font = .systemFont(ofSize: 16)
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(summaryLabel)

        NSLayoutConstraint.activate([
            summaryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            summaryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            summaryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            summaryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }

    func updateSummary(name: String, notifications: Bool,
                       theme: String, fontSize: Float) {

        summaryLabel.text = """
        Settings Summary

        Name: \(name)
        Notifications: \(notifications ? "ON" : "OFF")
        Theme: \(theme)
        Font Size: \(Int(fontSize))
        """
    }
}

