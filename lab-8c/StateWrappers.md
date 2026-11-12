
# SwiftUI State Management

## 1. @State
- Used for local state owned by a View.
- When the value changes, SwiftUI updates the View.
- Example: Search text and local toggle values.

## 2. @StateObject
- Used to create and own an ObservableObject.
- The object remains alive across View redraws.
- In this project, CourseListView owns CourseStore.

## 3. @ObservedObject
- Used to observe an existing ObservableObject.
- It does not create or own the shared object.
- In this project, CourseDetailView observes CourseStore.

## 4. @Binding
- Provides read and write access to state owned by another View.
- It allows child Views to update parent-owned values.
- In this project, CourseRowView uses Binding for favourite status.

## 5. @Published
- Used inside an ObservableObject.
- Notifies observing Views when a published property changes.
- In this project, courses and favouriteCourseIDs use @Published.

## Local State vs Shared State

### Local State
State should remain local when it is needed by only one View.

Example: Search text in CourseListView.

### Shared State
State should be shared when multiple Views need the same data.

Example: Favourite course IDs are shared between CourseListView and CourseDetailView.

## Conclusion
SwiftUI property wrappers help manage data and keep the user interface synchronized. This project uses local state, shared observable state and bindings to keep favourite information consistent across Views.
