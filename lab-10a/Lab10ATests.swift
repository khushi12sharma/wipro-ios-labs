
import XCTest
@testable import Lab10A

final class Lab10ATests: XCTestCase {

    // MARK: Grade Calculator Tests

    func testGradeAForNinetyMarks() {
        let calculator = GradeCalculator()
        XCTAssertEqual(calculator.calculateGrade(marks: 90), "A")
    }

    func testGradeBForSeventyFiveMarks() {
        let calculator = GradeCalculator()
        XCTAssertEqual(calculator.calculateGrade(marks: 75), "B")
    }

    func testGradeCForSixtyMarks() {
        let calculator = GradeCalculator()
        XCTAssertEqual(calculator.calculateGrade(marks: 60), "C")
    }

    func testGradeDForFortyMarks() {
        let calculator = GradeCalculator()
        XCTAssertEqual(calculator.calculateGrade(marks: 40), "D")
    }

    func testGradeFForZeroMarks() {
        let calculator = GradeCalculator()
        XCTAssertEqual(calculator.calculateGrade(marks: 0), "F")
    }

    func testInvalidGradeForMarksAboveHundred() {
        let calculator = GradeCalculator()
        XCTAssertEqual(calculator.calculateGrade(marks: 101), "Invalid")
    }

    // MARK: Form Validator Tests

    func testValidName() {
        let validator = FormValidator()
        XCTAssertTrue(validator.isValidName("Khushi"))
    }

    func testInvalidEmptyName() {
        let validator = FormValidator()
        XCTAssertFalse(validator.isValidName("   "))
    }

    func testValidEmail() {
        let validator = FormValidator()
        XCTAssertTrue(validator.isValidEmail("student@example.com"))
    }

    func testInvalidEmailWithoutAtSymbol() {
        let validator = FormValidator()
        XCTAssertFalse(validator.isValidEmail("studentexample.com"))
    }

    // MARK: ViewModel Tests

    func testAddFavouriteCourse() {
        let viewModel = CourseViewModel()
        viewModel.toggleFavourite(courseID: 1)

        XCTAssertTrue(viewModel.isFavourite(courseID: 1))
    }

    func testRemoveFavouriteCourse() {
        let viewModel = CourseViewModel()
        viewModel.toggleFavourite(courseID: 1)
        viewModel.toggleFavourite(courseID: 1)

        XCTAssertFalse(viewModel.isFavourite(courseID: 1))
    }
}
