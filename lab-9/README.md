# Lab 9: Project Configuration Audit

## Objective

Understand common iOS project settings, app metadata, privacy requirements, and safe configuration practices.

## Project Overview

This lab documents important iOS project settings and includes a simple SwiftUI welcome screen that does not require sensitive device permissions.

## Files Included

| File | Description |
|---|---|
| `ConfigurationChecklist.md` | Project and target settings audit |
| `InfoSettings.md` | App metadata and privacy settings |
| `FeatureNotes.md` | Permission-free feature and permission handling |
| `WelcomeView.swift` | Simple SwiftUI welcome screen |

## Requirements Covered

### R1: Project and Target Settings

Documented the purpose of:
- Bundle Identifier
- Version and Build Number
- Deployment Target
- Signing
- Supported Orientations
- Project Targets

Actual values are pending Xcode verification.

### R2: Info Settings and Privacy

Documented common app metadata and examples of privacy usage descriptions.

No sensitive permissions have been configured.

### R3: Feature Without Sensitive Permissions

Created a simple SwiftUI welcome screen using standard interface components.

The feature does not require camera, microphone, location, or photo library access.

### R4: Permission Handling

Documented how to explain permission requirements and handle denied permissions gracefully.

No permission request is implemented in this lab.

### R5: Configuration Scope

| Scope | Examples |
|---|---|
| Project | Project-wide settings |
| Target | Bundle identifier, version, deployment target |
| Build Configuration | Debug and Release settings |

## Debug and Release Configuration Notes

### Debug Configuration

- Used during development and testing.
- Commonly enables debugging information.
- May use development-specific settings.
- Helps developers identify and fix errors.

### Release Configuration

- Used to prepare the app for distribution.
- Commonly enables compiler optimizations.
- May use production-specific settings.
- Should not expose debugging information or development secrets.

Actual configuration values have not been inspected in Xcode.

## Screenshot Documentation

The following screenshots are planned for the final audit:

1. Project Targets
2. General App Settings
3. Signing and Capabilities
4. Info Settings
5. Debug and Release Build Configurations

**Status:** Screenshots are pending because Xcode is unavailable in the current Windows environment.

## Testing Status

| Test | Status |
|---|---|
| SwiftUI welcome screen compilation | Not Executed |
| Welcome screen UI on simulator | Not Executed |
| Permission-free feature review | Documented |
| Permission denial handling | Documented, not executed |

## Security Notes

- No certificates or private keys are included.
- No passwords, tokens, or secrets are committed.
- Only necessary permissions should be requested.
- Actual project settings must be verified before release.

## Conclusion

This lab documents common iOS configuration settings, app metadata, privacy practices, and Debug/Release differences. It also includes a permission-free SwiftUI welcome screen.

Actual Xcode inspection, compilation, simulator testing, and screenshots remain pending because the current working environment is Windows.
