# Lab 2B: Closures

## Objective
Understand closure syntax, closure capture, completion handlers, and memory management in Swift.

## Requirements Covered

1. **Student Sorting:** Used a closure to sort students by marks.
2. **Completion Closure:** Passed a closure to a function and called it after a simulated operation.
3. **Closure Syntax:** Demonstrated trailing closures, shorthand arguments, and explicit parameter names.
4. **Captured State:** Created a counter closure that maintains its captured variable between calls.
5. **Retain Cycle Prevention:** Used `[weak self]` to avoid a strong reference cycle in a stored closure.

## Optional Extension
Implemented a retry helper that accepts an operation closure and retries until it succeeds or reaches the attempt limit.

## Files

- `Closures.swift` — Complete Swift source code.
- `LabReport.md` — Explanation of closure behaviour, capture, and lifetime.
- `README.md` — Lab overview and requirements.

## Execution
The program was executed successfully using JDoodle Swift Compiler.

## Conclusion
This lab demonstrates how closures make Swift code reusable and flexible while safe capture techniques help manage object lifetimes.
