
import UIKit

class TaskViewController: UIViewController,
                          UITableViewDataSource,
                          UITableViewDelegate {

    private let model = TaskModel()

    private var currentFilter: TaskFilter = .all

    private let taskInput = UITextField()
    private let addButton = UIButton(type: .system)
    private let filterControl = UISegmentedControl(
        items: ["All", "Pending", "Completed"]
    )
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Task Manager"

        setupUI()
    }

    private func setupUI() {

        taskInput.placeholder = "Enter a task"
        taskInput.borderStyle = .roundedRect

        addButton.setTitle("Add Task", for: .normal)
        addButton.addTarget(
            self,
            action: #selector(addTask),
            for: .touchUpInside
        )

        filterControl.selectedSegmentIndex = 0
        filterControl.addTarget(
            self,
            action: #selector(filterChanged),
            for: .valueChanged
        )

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "TaskCell"
        )

        let stack = UIStackView(arrangedSubviews: [
            taskInput,
            addButton,
            filterControl,
            tableView
        ])

        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 16
            ),
            stack.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 16
            ),
            stack.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -16
            ),
            stack.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -16
            ),
            taskInput.heightAnchor.constraint(equalToConstant: 40),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            filterControl.heightAnchor.constraint(equalToConstant: 35)
        ])
    }

    @objc private func addTask() {

        guard model.addTask(title: taskInput.text ?? "") else {
            showMessage("Please enter a valid task.")
            return
        }

        taskInput.text = ""
        tableView.reloadData()
    }

    @objc private func filterChanged() {

        switch filterControl.selectedSegmentIndex {
        case 1:
            currentFilter = .pending
        case 2:
            currentFilter = .completed
        default:
            currentFilter = .all
        }

        tableView.reloadData()
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return model.filteredTasks(currentFilter).count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TaskCell",
            for: indexPath
        )

        let task = model.filteredTasks(currentFilter)[indexPath.row]

        cell.textLabel?.text = task.title

        cell.accessoryType = task.isCompleted
            ? .checkmark
            : .none

        return cell
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {

        let task = model.filteredTasks(currentFilter)[indexPath.row]

        model.completeTask(id: task.id)
        tableView.reloadData()
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {

        if editingStyle == .delete {

            let task = model.filteredTasks(currentFilter)[indexPath.row]

            model.deleteTask(id: task.id)
            tableView.reloadData()
        }
    }

    private func showMessage(_ message: String) {

        let alert = UIAlertController(
            title: "Task Manager",
            message: message,
            preferredStyle: .alert
        )

        alert.addAction(
            UIAlertAction(title: "OK", style: .default)
        )

        present(alert, animated: true)
    }
}
