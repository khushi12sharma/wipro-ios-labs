import UIKit

class TaskListViewController: UIViewController,
                              UITableViewDataSource,
                              UITableViewDelegate {

    private let viewModel = TaskViewModel()

    private let taskInput = UITextField()
    private let addButton = UIButton(type: .system)
    private let filterControl = UISegmentedControl(
        items: ["All", "Pending", "Completed"]
    )
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MVVM Task Manager"
        view.backgroundColor = .systemBackground

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
        let success = viewModel.addTask(
            title: taskInput.text ?? ""
        )

        if success {
            taskInput.text = ""
            tableView.reloadData()
        } else {
            showMessage("Please enter a valid task.")
        }
    }

    @objc private func filterChanged() {
        switch filterControl.selectedSegmentIndex {
        case 1:
            viewModel.changeFilter(.pending)

        case 2:
            viewModel.changeFilter(.completed)

        default:
            viewModel.changeFilter(.all)
        }

        tableView.reloadData()
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return viewModel.visibleTasks.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TaskCell",
            for: indexPath
        )

        let task = viewModel.visibleTasks[indexPath.row]

        cell.textLabel?.text = task.title
        cell.accessoryType = task.isCompleted ? .checkmark : .none

        return cell
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let task = viewModel.visibleTasks[indexPath.row]

        viewModel.completeTask(id: task.id)
        tableView.reloadData()
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            let task = viewModel.visibleTasks[indexPath.row]

            viewModel.deleteTask(id: task.id)
            tableView.reloadData()
        }
    }

    private func showMessage(_ message: String) {
        let alert = UIAlertController(
            title: "MVVM Task Manager",
            message: message,
            preferredStyle: .alert
        )

        alert.addAction(
            UIAlertAction(title: "OK", style: .default)
        )

        present(alert, animated: true)
    }
}
