# Lab 2D – Error Handling

## Objective
To practice safe error handling in Swift using custom errors, throwing functions, do-catch, optionals, and Result.

## Concepts Covered

### 1. Custom Errors
- Created `ValidationError` enum.
- Added empty name, invalid marks, and invalid ID cases.

### 2. Throwing Functions
- Implemented a student registration function using `throws`.
- Validated student details before registration.

### 3. Do-Catch
- Handled each validation error separately.
- Displayed meaningful error messages.

### 4. Error Handling Approaches
- Throws
- Optional return
- Result type
- `try?` for safe error handling

### 5. User-Friendly Messages
- Transformed validation errors into readable messages using Result.

## Files Included

| File | Description |
|---|---|
| ErrorHandling.swift | Complete Swift source code |
| Output.md | Program output |
| TestCases.md | Success and failure test cases |
| LabReport.md | Concepts and implementation report |
| README.md | Lab overview |

## Testing
- Executed using JDoodle Swift Compiler.
- All 8 assertion checks passed.
- Invalid inputs were handled without crashing the program.

## Result
Successfully implemented explicit error handling and safe validation in Swift.
