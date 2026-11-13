
# Lab 10B: UI Automation with XCUITest

## Objective
To automate the student registration journey and verify visible results using XCUITest.

## Project Files

- CourseRegistrationUITests.swift - Contains UI automation test cases.
- RegistrationView.swift - Registration form with accessibility identifiers.
- CourseExplorerView.swift - Navigation to the registration form.

## Test Cases

### 1. Successful Registration
- Launches the application.
- Opens the registration form.
- Enters student name and email.
- Submits the form.
- Verifies the registration success message.

### 2. Empty Name Validation
- Launches the application.
- Opens the registration form.
- Submits the form without entering a name.
- Verifies the validation error message.

## Accessibility Identifiers

- course.registrationButton
- registration.nameField
- registration.emailField
- registration.submitButton
- registration.errorMessage
- registration.successMessage

## Waiting Strategy

The tests use waitForExistence(timeout:) to wait for expected UI elements instead of unnecessary fixed sleeps.

## Unit Test vs UI Test

### Unit Test
A unit test checks a small piece of application logic independently from the user interface.

Example: Testing whether a grade calculator returns the correct grade.

### UI Test
A UI test launches the application and interacts with visible controls to verify a complete user journey.

Example: Entering registration details, tapping the Register button, and checking the success message.

## Test Execution Status

XCUITest source code has been prepared.

Execution status: Not Run.

Reason: Xcode and an iOS Simulator are not available on the current Windows system.

A screenshot of a successful test run is pending execution on a Mac with Xcode.

## Conclusion

The UI automation source covers successful registration and empty-name validation. Accessibility identifiers and element waiting are used to make the tests more reliable.
