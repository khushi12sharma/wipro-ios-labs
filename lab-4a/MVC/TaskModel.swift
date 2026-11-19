
import Foundation

enum TaskFilter {
    case all
    case pending
    case completed
}

class TaskModel {

    private(set) var tasks: [Task] = []

    func addTask(title: String) -> Bool {

        let trimmedTitle = title.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !trimmedTitle.isEmpty else {
            return false
        }

        let newTask = Task(
            id: (tasks.map { $0.id }.max() ?? 0) + 1,
            title: trimmedTitle,
            isCompleted: false
        )

        tasks.append(newTask)
        return true
    }

    func completeTask(id: Int) {
        guard let index = tasks.firstIndex(where: {
            $0.id == id
        }) else {
            return
        }

        tasks[index].isCompleted = true
    }

    func deleteTask(id: Int) {
        tasks.removeAll { $0.id == id }
    }

    func filteredTasks(_ filter: TaskFilter) -> [Task] {

        switch filter {
        case .all:
            return tasks

        case .pending:
            return tasks.filter { !$0.isCompleted }

        case .completed:
            return tasks.filter { $0.isCompleted }
        }
    }
}
