import Foundation

struct TaskItem {
    let id: Int
    var title: String
    var isCompleted: Bool
}

class TaskViewModel {
    private(set) var tasks: [TaskItem] = []

    func addTask(title: String) {
        let newTask = TaskItem(
            id: tasks.count + 1,
            title: title,
            isCompleted: false
        )
        tasks.append(newTask)
    }

    func completeTask(id: Int) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isCompleted = true
        }
    }

    func getPendingTasks() -> [TaskItem] {
        return tasks.filter { !$0.isCompleted }
    }
}
