
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
}
