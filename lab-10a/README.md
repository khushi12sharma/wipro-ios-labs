
# Lab 10A: XCTest Unit Tests

## Objective
To test application logic independently from the user interface using XCTest.

## Project Structure

- Package.swift - Defines the Swift package and XCTest target.
- GradeCalculator.swift - Contains grade calculation logic.
- FormValidator.swift - Validates student names and email addresses.
- CourseViewModel.swift - Manages favourite course operations.
- Lab10ATests.swift - Contains 12 unit test cases.

## Test Coverage

### 1. Grade Calculator
- Grade A for 90 marks.
- Grade B for 75 marks.
- Grade C for 60 marks.
- Grade D for 40 marks.
- Grade F for 0 marks.
- Invalid result for marks above 100.

### 2. Form Validation
- Valid student name.
- Empty or whitespace-only name.
- Valid email address.
- Email without @ symbol.

### 3. ViewModel
- Add a course to favourites.
- Remove a course from favourites.

## Test Execution Status

Test cases have been written using XCTest.

Execution status: Not Run.

Reason: Xcode and XCTest execution environment are not available on the current Windows system.

A screenshot of a passing test run is pending actual execution on a Mac with Xcode.

## Conclusion

The project contains 12 descriptive unit tests covering normal cases, boundary cases, invalid inputs, and ViewModel operations.
