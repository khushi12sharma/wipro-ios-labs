import Foundation

let viewModel = TaskViewModel()

viewModel.addTask(title: "Learn Swift")
viewModel.addTask(title: "Practice MVVM")

assert(viewModel.tasks.count == 2)
print("Test 1 Passed: Tasks added successfully")

viewModel.completeTask(id: 1)

assert(viewModel.tasks[0].isCompleted == true)
print("Test 2 Passed: Task completed successfully")

assert(viewModel.getPendingTasks().count == 1)
print("Test 3 Passed: Pending tasks count is correct")
