# Milestone 4: SwiftUI and Configuration

## Objective

Build a SwiftUI application using navigation, state management, data binding, and form validation.

## Project: Course Explorer App

Course Explorer is a simple iOS application that allows users to explore courses, manage favourites, and register for a course.

## Files Included

| File | Purpose |
|---|---|
| `AssessmentM4App.swift` | Application entry point |
| `Course.swift` | Course model and sample data |
| `CourseExplorerView.swift` | Course list and navigation |
| `CourseDetailView.swift` | Course details and favourite management |
| `RegistrationView.swift` | Validated registration form |
| `ConfigurationNotes.md` | App configuration explanation |
| `VivaNotes.md` | SwiftUI viva questions and answers |

## Requirements Covered

### R1: SwiftUI List-Detail Navigation

- Uses `NavigationStack`.
- Displays courses using `List` and `ForEach`.
- Opens course details using `NavigationLink`.

### R2: Favourite Management

- Uses `@State` to store favourite course IDs.
- Uses `@Binding` to share favourite status.
- Allows users to add and remove favourites.
- Updates the list and detail views together.

### R3: Validated Registration Form

- Collects student name and email.
- Provides course selection.
- Validates required information.
- Displays loading, error, and success states.

### R4: App Configuration

Explains:
- SwiftUI app entry point.
- Bundle Identifier.
- Deployment Target.
- Privacy usage descriptions.
- Safe configuration practices.

Actual project settings require Xcode verification.

### R5: Viva Preparation

`VivaNotes.md` explains:
- `@State` and `@Binding`
- `App` and `View` protocols
- `NavigationStack`
- Favourite synchronization
- Form validation

## Testing Status

| Test | Status |
|---|---|
| Course list and navigation | Not Executed |
| Favourite add/remove | Not Executed |
| Favourite synchronization | Not Executed |
| Empty name validation | Not Executed |
| Invalid email validation | Not Executed |
| Registration success state | Not Executed |

**Note:** Xcode and iOS Simulator testing could not be performed because the development environment is Windows without macOS/Xcode.

## Security

- No certificates or private keys are included.
- No sensitive device permissions are requested.
- No passwords, tokens, or secrets are committed.

## Conclusion

This milestone demonstrates SwiftUI navigation, state management, data binding, form validation, and basic iOS configuration concepts through a Course Explorer application.
