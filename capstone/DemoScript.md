
# Course Planner - Demo Script

## Introduction (30 seconds)
Hello, my project is Course Planner. It is a SwiftUI-based application designed to help students organize their learning courses and track their progress.

## Screen 1: Course List (40 seconds)
The home screen displays available courses with their names and duration.

Users can:
- Search courses by name.
- View completed course count.
- Check overall learning progress.
- Open course details.
- Navigate to registration.

## Screen 2: Course Details (40 seconds)
The detail screen displays the selected course information.

Users can mark a course as favourite or completed. The ViewModel updates the course data and learning progress.

## Screen 3: Registration (40 seconds)
The registration screen accepts the student's name, email and selected course.

It validates the input and displays an error message for invalid information or a success message for valid information.

## Architecture (30 seconds)
The project follows an MVVM-inspired structure.

- Model stores course information.
- Views display the user interface.
- ViewModel manages course data and business logic.
- FormValidator handles input validation.

## Testing and Conclusion (30 seconds)
I have written eight unit test cases for name and email validation using XCTest. Actual test execution and simulator demonstration are pending.

This project helped me understand SwiftUI navigation, state management, reusable code and unit testing.
