
import XCTest
@testable import YourAppModule

final class TaskViewModelTests: XCTestCase {

    func testAddValidTask() {
        let viewModel = TaskViewModel()

        let result = viewModel.addTask(title: "Study Swift")

        XCTAssertTrue(result)
        XCTAssertEqual(viewModel.tasks.count, 1)
        XCTAssertEqual(viewModel.tasks[0].title, "Study Swift")
    }

    func testRejectEmptyTask() {
        let viewModel = TaskViewModel()

        let result = viewModel.addTask(title: "   ")

        XCTAssertFalse(result)
        XCTAssertEqual(viewModel.tasks.count, 0)
    }

    func testCompleteTask() {
        let viewModel = TaskViewModel()
        _ = viewModel.addTask(title: "Complete Lab")

        viewModel.completeTask(id: 1)

        XCTAssertTrue(viewModel.tasks[0].isCompleted)
    }

    func testDeleteTask() {
        let viewModel = TaskViewModel()
        _ = viewModel.addTask(title: "Delete Me")

        viewModel.deleteTask(id: 1)

        XCTAssertEqual(viewModel.tasks.count, 0)
    }

    func testPendingFilter() {
        let viewModel = TaskViewModel()
        _ = viewModel.addTask(title: "Task One")
        _ = viewModel.addTask(title: "Task Two")

        viewModel.completeTask(id: 1)
        viewModel.changeFilter(.pending)

        XCTAssertEqual(viewModel.visibleTasks.count, 1)
        XCTAssertEqual(viewModel.visibleTasks[0].title, "Task Two")
    }

    func testCompletedFilter() {
        let viewModel = TaskViewModel()
        _ = viewModel.addTask(title: "Task One")
        _ = viewModel.addTask(title: "Task Two")

        viewModel.completeTask(id: 1)
        viewModel.changeFilter(.completed)

        XCTAssertEqual(viewModel.visibleTasks.count, 1)
        XCTAssertEqual(viewModel.visibleTasks[0].title, "Task One")
    }
}
