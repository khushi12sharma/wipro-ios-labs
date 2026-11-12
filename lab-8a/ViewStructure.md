
# Lab 8A: SwiftUI View Structure

## App Structure

The Course Explorer app is built using reusable SwiftUI views.

## Main Views

### 1. CourseExplorerApp
The main entry point of the application. It launches CourseExplorerView.

### 2. CourseExplorerView
Displays the app title, category filters and course list.

### 3. CourseCardView
A reusable card that displays course title, category, description and duration.

### 4. CourseDetailView
Displays detailed information about a selected course.

### 5. EmptyStateView
Displays a message when no courses are available.

## SwiftUI Layout Components

- VStack: Arranges views vertically.
- HStack: Arranges views horizontally.
- ZStack: Places views on top of each other.
- ScrollView: Allows horizontal scrolling through categories.
- List: Displays the available courses.
- NavigationStack: Manages navigation between course list and detail screen.

## Reusable Views

CourseCardView and EmptyStateView are separate custom views. This keeps the main view readable and makes components reusable.

## Empty State

When the filtered course list is empty, EmptyStateView is displayed instead of the course list.

## Preview and Testing Status

A SwiftUI preview is included in CourseExplorerView.swift.

Actual preview rendering and simulator testing have not been performed because macOS and Xcode are unavailable.
