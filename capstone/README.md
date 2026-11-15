
# Course Planner

## 1. Problem Statement

Students often find it difficult to organize their learning courses and track their completion progress. Course Planner provides a simple application to manage courses and monitor learning progress.

## 2. Target Users

- College students
- Beginners learning iOS development
- Students who want to track their courses

## 3. Features

- View available courses.
- Search courses by name.
- View course details.
- Mark courses as favourite.
- Mark courses as completed.
- Track course completion progress.
- Register for a course.
- Validate student name and email.
- Display empty search and validation error states.

## 4. Technology Used

- Swift
- SwiftUI
- XCTest
- MVVM architecture pattern

## 5. Project Structure

- Course.swift - Course data model.
- CoursePlannerViewModel.swift - Course data and business logic.
- CoursePlannerApp.swift - Application entry point.
- CourseListView.swift - Course listing screen.
- CourseDetailView.swift - Course details screen.
- RegistrationView.swift - Registration form.
- FormValidator.swift - Reusable validation helper.
- CoursePlannerTests.swift - Unit test cases.
- Architecture.md - Architecture diagram.
- DemoScript.md - Project demonstration script.
- TestEvidence.md - Testing documentation.

## 6. Architecture

The application follows a simple MVVM-inspired structure.

- Model: Stores course information.
- View: Displays the user interface using SwiftUI.
- ViewModel: Manages course data, search, favourites and progress.
- Helper: Validates registration input.

## 7. Setup and Run

1. Open the project in Xcode on macOS.
2. Create a SwiftUI App project.
3. Add the source files to the app target.
4. Add CoursePlannerTests.swift to the test target.
5. Ensure the test module import matches the app target name.
6. Select an iOS Simulator.
7. Build and run the application.

## 8. Testing

Framework: XCTest

Thirteen unit test cases have been written for:

- Name validation.
- Email validation.
- Registration validation.
- Initial course count.
- Favourite functionality.
- Course completion.
- Completion progress.
- Course search.

Tests have not yet been executed because an Xcode environment is unavailable.

## 9. Limitations

- Course data is stored in memory.
- Registration is demonstrated locally; no backend is connected.
- Data does not persist after the application restarts.
- Actual simulator screenshots and test-run evidence are pending.

## 10. Known Issues

- Search currently checks course names only.
- Email validation uses basic checks.
- Registration does not save data to a server.
- Xcode build and runtime verification are pending.

## 11. Future Improvements

- Add database integration.
- Save course information permanently.
- Add student login and authentication.
- Add course categories and filters.
- Improve email validation.
