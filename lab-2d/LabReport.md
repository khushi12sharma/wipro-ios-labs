# Lab 2D – Error Handling

## Objective
To understand how Swift models errors explicitly and handles invalid input safely without crashing.

## 1. ValidationError Enum
Created an enum conforming to the Error protocol with three cases:
- `emptyName`
- `invalidMark`
- `invalidID`

## 2. Throwing Registration Function
Created `registerStudent()` using `throws`.

It validates:
- Student name must not be empty.
- Marks must be between 0 and 100.
- Student ID must be positive.

Invalid inputs throw appropriate validation errors.

## 3. Do-Catch Error Handling
Used `do-catch` to handle each validation error separately and display useful messages.

## 4. Throws vs Optional vs Result

| Approach | Purpose |
|---|---|
| throws | Reports errors using thrown error values |
| Optional | Returns a value or nil |
| Result | Represents success or failure explicitly |

## 5. Safe Input Handling
Used `try?` to convert a throwing operation into an optional result.

Invalid input is handled safely without crashing the program.

## 6. Optional Extension
Used `Result<Student, ValidationError>` to convert validation errors into user-friendly messages.

## 7. Assertion Checks
Eight assertion checks were executed successfully, covering valid registration, invalid input, optional results, and Result success/failure.

## Result
The Swift program executed successfully in JDoodle. All 8 assertion checks passed.
