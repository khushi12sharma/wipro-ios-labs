# SwiftUI App Configuration Notes

## 1. App Entry Point

The app entry point is defined in `AssessmentM4App.swift`.

```swift
@main
struct AssessmentM4App: App {
    var body: some Scene {
        WindowGroup {
            CourseExplorerView()
        }
    }
}
```

- `@main` identifies the starting point of the application.
- `App` defines the application structure.
- `WindowGroup` creates the app's main window.
- `CourseExplorerView()` displays the initial screen.

## 2. Bundle Identifier

A Bundle Identifier uniquely identifies an iOS application.

Example format: `com.example.CourseExplorer`

The actual Bundle Identifier must be checked in Xcode under the app target's General settings.

## 3. Deployment Target

The Deployment Target specifies the minimum iOS version supported by the application.

It helps developers decide which iOS features and APIs can be used.

The actual deployment target for this project is pending Xcode verification.

## 4. Privacy Usage Descriptions

Privacy usage descriptions explain why an application needs access to protected device resources.

Examples include:
- Camera access
- Photo Library access
- Location access
- Microphone access

The Course Explorer application does not request these permissions. Its current features use standard SwiftUI interface components.

Therefore, no sensitive permission usage description is required for the implemented features.

## 5. Security Practices

- Request only necessary permissions.
- Explain permission purposes clearly.
- Never commit private keys or certificates.
- Avoid storing unnecessary personal information.
- Handle errors without crashing the application.

## 6. Verification Status

The current development environment is Windows without Xcode.

Actual Bundle Identifier and Deployment Target values are not verified. These settings require inspection in Xcode on macOS.
