
import XCTest

final class CourseRegistrationUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testStudentCanRegisterSuccessfully() throws {
        let app = XCUIApplication()
        app.launch()

        let registrationButton = app.buttons["course.registrationButton"]
        XCTAssertTrue(registrationButton.waitForExistence(timeout: 5))
        registrationButton.tap()

        let nameField = app.textFields["registration.nameField"]
        XCTAssertTrue(nameField.waitForExistence(timeout: 5))
        nameField.tap()
        nameField.typeText("Khushi")

        let emailField = app.textFields["registration.emailField"]
        XCTAssertTrue(emailField.exists)
        emailField.tap()
        emailField.typeText("khushi@example.com")

        app.buttons["registration.submitButton"].tap()

        let successMessage = app.descendants(matching: .any)
            .matching(identifier: "registration.successMessage")
            .firstMatch

        XCTAssertTrue(successMessage.waitForExistence(timeout: 5))
    }

    @MainActor
    func testEmptyNameShowsValidationError() throws {
        let app = XCUIApplication()
        app.launch()

        let registrationButton = app.buttons["course.registrationButton"]
        XCTAssertTrue(registrationButton.waitForExistence(timeout: 5))
        registrationButton.tap()

        let submitButton = app.buttons["registration.submitButton"]
        XCTAssertTrue(submitButton.waitForExistence(timeout: 5))
        submitButton.tap()

        let errorMessage = app.staticTexts["registration.errorMessage"]
        XCTAssertTrue(errorMessage.waitForExistence(timeout: 5))
        XCTAssertEqual(errorMessage.label, "Please enter your name.")
    }
}
