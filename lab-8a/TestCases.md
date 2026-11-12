
# Lab 8A Test Cases

| Test Case | Expected Result |
|---|---|
| Launch the app | Course Explorer screen appears |
| Display course cards | All sample courses are visible |
| Select a category | Only matching courses are displayed |
| Select All category | All courses are displayed |
| Open a course card | Course detail screen appears |
| View course details | Title, category, description, duration and instructor appear |
| Empty course list | EmptyStateView displays a message |
| Navigate back | Course Explorer screen appears again |

## Requirement Mapping

| Requirement | Implementation |
|---|---|
| R1: Course Explorer app | CourseExplorerView.swift |
| R2: SwiftUI layout components | VStack, HStack, ZStack, ScrollView and List |
| R3: Preview or simulator | #Preview in CourseExplorerView.swift |
| R4: Reusable views | CourseCardView.swift and EmptyStateView.swift |
| R5: Empty state | EmptyStateView.swift |

## Execution Status

Not Executed.

Source code and test cases are prepared. Actual SwiftUI preview and simulator testing require macOS and Xcode.
