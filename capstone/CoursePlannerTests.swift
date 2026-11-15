
import XCTest
@testable import CoursePlanner

final class CoursePlannerTests: XCTestCase {

    func testValidName() {
        XCTAssertTrue(FormValidator.validateName("Khushi"))
    }

    func testEmptyName() {
        XCTAssertFalse(FormValidator.validateName(""))
    }

    func testNameWithOnlySpaces() {
        XCTAssertFalse(FormValidator.validateName("   "))
    }

    func testValidEmail() {
        XCTAssertTrue(FormValidator.validateEmail("khushi@example.com"))
    }

    func testEmailWithoutAtSymbol() {
        XCTAssertFalse(FormValidator.validateEmail("khushiexample.com"))
    }

    func testEmailWithoutDot() {
        XCTAssertFalse(FormValidator.validateEmail("khushi@example"))
    }

    func testEmailWithSpaces() {
        XCTAssertFalse(FormValidator.validateEmail("khushi @example.com"))
    }

    func testRegistrationWithInvalidName() {
        let result = FormValidator.validateRegistration(
            name: "",
            email: "khushi@example.com"
        )

        XCTAssertEqual(result, "Please enter your name.")
    }

    func testInitialCourseCount() {
        let viewModel = CoursePlannerViewModel()
        XCTAssertEqual(viewModel.courses.count, 3)
    }

    func testToggleFavourite() {
        let viewModel = CoursePlannerViewModel()
        let course = viewModel.courses[0]

        viewModel.toggleFavourite(for: course)

        XCTAssertTrue(viewModel.courses[0].isFavourite)
    }

    func testToggleCompleted() {
        let viewModel = CoursePlannerViewModel()
        let course = viewModel.courses[0]

        viewModel.toggleCompleted(for: course)

        XCTAssertTrue(viewModel.courses[0].isCompleted)
    }

    func testCompletedCourseCount() {
        let viewModel = CoursePlannerViewModel()
        let course = viewModel.courses[0]

        viewModel.toggleCompleted(for: course)

        XCTAssertEqual(viewModel.completedCount, 1)
    }

    func testSearchCourses() {
        let viewModel = CoursePlannerViewModel()
        viewModel.searchText = "Swift"

        XCTAssertEqual(viewModel.filteredCourses.count, 2)
    }
}
