
import UIKit

class CourseDetailViewController: UIViewController {

    private let course: Course

    private let nameLabel = UILabel()
    private let durationLabel = UILabel()
    private let descriptionLabel = UILabel()

    init(course: Course) {
        self.course = course
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {

        title = "Course Details"
        view.backgroundColor = .systemBackground

        nameLabel.text = course.name
        nameLabel.font = .boldSystemFont(ofSize: 24)
        nameLabel.numberOfLines = 0

        durationLabel.text = "Duration: \(course.duration)"
        durationLabel.font = .systemFont(ofSize: 18)

        descriptionLabel.text = course.description
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0

        let stack = UIStackView(arrangedSubviews: [
            nameLabel,
            durationLabel,
            descriptionLabel
        ])

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
                constant: 24
            ),
            stack.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -24
            )
        ])
    }
}
