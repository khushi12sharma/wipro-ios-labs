# Info Settings and Privacy Review

## 1. Introduction

The Info settings of an iOS application contain important app metadata and configuration information.

These settings help iOS identify the application and understand its supported features.

## 2. Common App Metadata

| Setting | Description |
|---|---|
| Display Name | Name displayed below the app icon |
| Bundle Identifier | Unique identifier of the application |
| Version | Current release version |
| Build Number | Identifier for an individual build |
| Deployment Target | Minimum iOS version supported |
| Supported Orientations | Screen orientations supported by the app |

## 3. Privacy Usage Descriptions

iOS applications must explain why they need access to protected resources.

Examples:

| Permission | Example Usage Description |
|---|---|
| Camera | Used to capture a profile photo |
| Photo Library | Used to select a profile picture |
| Location | Used to show location-based information |
| Microphone | Used to record audio when required |

These descriptions should only be added when the application actually requests the corresponding permission.

## 4. Privacy and Security Practices

- Request only the permissions required by the app.
- Explain the purpose before requesting access.
- Do not store sensitive information unnecessarily.
- Never commit certificates, private keys, or credentials.
- Handle permission denial without crashing the app.

## 5. Audit Status

Xcode is not available in the current Windows environment. Therefore, actual Info settings and privacy descriptions could not be inspected.

No permission has been requested or configured as part of this documentation exercise.

## 6. Conclusion

App metadata and privacy descriptions are important for application identification, compatibility, and user trust. Actual configuration values must be verified in Xcode before release.
