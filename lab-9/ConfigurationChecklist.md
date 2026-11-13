# Lab 9: Project Configuration Audit

## Objective
To understand common iOS project settings and document app configuration safely.

## Environment
- Operating System: Windows
- Xcode Availability: Not available
- Audit Type: Documentation-based review
- Actual Xcode settings: Pending verification

## R1: Project and Target Settings Checklist

| Setting | Purpose | Status |
|---|---|---|
| Project Targets | Defines the app targets in a project | Pending Xcode verification |
| Bundle Identifier | Uniquely identifies the app | Pending Xcode verification |
| Version | Represents the app's release version | Pending Xcode verification |
| Build Number | Identifies a particular build | Pending Xcode verification |
| Deployment Target | Specifies the minimum supported iOS version | Pending Xcode verification |
| Signing | Configures app signing and development team | Pending Xcode verification |
| Supported Orientations | Defines supported device orientations | Pending Xcode verification |

## R2: Info Settings Review

The app's Info settings contain metadata and configuration values.

Examples include:
- Display name
- Bundle identifier
- Version and build number
- Supported orientations
- Privacy usage descriptions, when permissions are required

No permission-related usage description has been configured or verified in this audit.

## R3: Feature Without Sensitive Permissions

A simple welcome screen or static information screen can be added without requesting sensitive device permissions.

This type of feature does not require access to:
- Camera
- Microphone
- Location
- Photo Library

## R4: Permission Safety

No sensitive permission is being requested in this documentation-based audit.

If a permission is added in a future version:
1. Explain its purpose clearly to the user.
2. Add the appropriate privacy usage description.
3. Check the permission status before using the feature.
4. Handle denied permission gracefully.
5. Allow the app to continue working where possible.

## R5: Configuration Scope

| Scope | Examples |
|---|---|
| Project Level | Project-wide build settings and project organization |
| Target Level | Bundle identifier, app version, deployment target and supported orientations |
| Build Configuration Level | Debug and Release settings |

## Screenshot Checklist

The following screenshots should be captured from Xcode when access to macOS is available:

1. Project and Targets screen
2. General settings showing bundle identifier and deployment target
3. Signing and Capabilities settings
4. Info settings and supported orientations
5. Build Configurations showing Debug and Release

**Note:** Screenshots are pending because Xcode is not available in the current Windows environment. No certificates, private keys, or secrets are included in this repository.

## Conclusion

This audit documents common iOS project configuration settings, privacy considerations, permission safety, and configuration scopes. Actual project values require verification in Xcode.
