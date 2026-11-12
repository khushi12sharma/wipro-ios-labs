
# Milestone 3 Test Cases

## 1. Form Validation

| Test Case | Input | Expected Result |
|---|---|---|
| Empty name | Name is blank | Validation error |
| Empty email | Email is blank | Validation error |
| Invalid email | khushi123 | Validation error |
| Valid details | Name and valid email | Success message |

## 2. API and JSON Decoding

| Test Case | Condition | Expected Result |
|---|---|---|
| Successful API request | API returns valid JSON | User list is decoded |
| Invalid response | Server returns an unsuccessful status | API error is handled |
| Empty response data | No response data | No-data error is handled |
| Empty user list | API returns an empty users array | Empty state is displayed |

## 3. Screen States

| State | Expected Result |
|---|---|
| Loading | Activity indicator is visible |
| Empty | No users message is displayed |
| Failure | Error message is displayed |
| Loaded | User list is displayed |

## 4. Navigation

| Test Case | Expected Result |
|---|---|
| Select a user row | User detail screen opens |
| Open detail screen | Selected user's name, email and ID are displayed |

## Execution Status

**Not Executed**

The source code and test cases are prepared. Actual UIKit testing requires macOS and Xcode, which were not available during this task.
