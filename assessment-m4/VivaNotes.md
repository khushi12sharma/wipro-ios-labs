# Milestone 4: SwiftUI Viva Notes

## 1. What is @State?

`@State` is a property wrapper used to store and manage data inside a SwiftUI view.

When its value changes, SwiftUI automatically updates the user interface.

Example:
```swift
@State private var isFavourite = false
```

## 2. What is @Binding?

`@Binding` allows a child view to read and modify a value owned by a parent view.

It helps keep multiple views synchronized.

Example:
```swift
@Binding var isFavourite: Bool
```

## 3. Difference Between @State and @Binding

| @State | @Binding |
|---|---|
| Owns the data | Shares existing data |
| Manages local state | Connects to another view's state |
| Used by the parent view | Often used by child views |

## 4. What is the App Protocol?

The `App` protocol defines the structure and entry point of a SwiftUI application.

The app uses the `@main` attribute to identify its starting point.

## 5. What is a View?

A `View` is a building block of a SwiftUI user interface.

Examples include:
- Text
- Button
- Image
- List
- VStack
- NavigationStack

## 6. What is NavigationStack?

`NavigationStack` manages navigation between screens in a SwiftUI application.

It allows users to move from a list screen to a detail screen.

## 7. What is a Binding?

A binding creates a connection to a value stored elsewhere. When the bound value changes, the source of that value is updated.

## 8. Explain the Course Explorer App

The application displays a list of courses using SwiftUI.

Users can:
- View available courses.
- Open course details.
- Add or remove favourite courses.
- Open a registration form.
- Enter student information and register for a course.

## 9. How Does Favourite Synchronization Work?

The parent view stores favourite course IDs using `@State`.

The detail view receives a `Binding` to the favourite status. When the user changes it, the parent view is updated automatically.

## 10. How Does Form Validation Work?

The registration form checks that:
- Student name is not empty.
- Email contains `@` and `.`.

It displays an error for invalid input and a success confirmation after valid submission.

## Conclusion

SwiftUI uses declarative views and state management to build interactive applications. `@State`, `@Binding`, `NavigationStack`, `App`, and `View` are important concepts used in this milestone.
