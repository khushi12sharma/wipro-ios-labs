import Foundation

struct MVVMTask {
    let id: Int
    var title: String
    var isCompleted: Bool
}

enum MVVMTaskFilter {
    case all
    case pending
    case completed
}

final class TaskViewModel {

    private(set) var tasks: [MVVMTask] = []
    var currentFilter: MVVMTaskFilter = .all

    var visibleTasks: [MVVMTask] {
        switch currentFilter {
        case .all:
            return tasks

        case .pending:
            return tasks.filter { !$0.isCompleted }

        case .completed:
            return tasks.filter { $0.isCompleted }
        }
    }

    func addTask(title: String) -> Bool {
        let trimmedTitle = title.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !trimmedTitle.isEmpty else {
            return false
        }

        let newTask = MVVMTask(
            id: (tasks.map { $0.id }.max() ?? 0) + 1,
            title: trimmedTitle,
            isCompleted: false
        )

        tasks.append(newTask)
        return true
    }

    func completeTask(id: Int) {
        guard let index = tasks.firstIndex(
            where: { $0.id == id }
        ) else {
            return
        }

        tasks[index].isCompleted = true
    }

    func deleteTask(id: Int) {
        tasks.removeAll { $0.id == id }
    }

    func changeFilter(_ filter: MVVMTaskFilter) {
        currentFilter = filter
    }
}
