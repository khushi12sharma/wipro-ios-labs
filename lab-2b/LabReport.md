# Lab 2B: Closures

## Objective
Understand how closures can be passed as values, how closure syntax works, and how closures capture values and manage object lifetimes.

## 1. Student Sorting
Used a closure with `sorted` to arrange students by marks in descending order.

## 2. Completion Closure
Created a function that accepts a completion closure. The closure is called after a simulated operation finishes and receives the result.

## 3. Trailing Closure and Shorthand Arguments
Used trailing-closure syntax with shorthand arguments `$0` and `$1`. Rewrote another example using explicit parameter names to make the code easier to understand.

## 4. Captured State
Created a counter closure that captures the local variable `count`. The value remains available between calls, so the counter produces 1, 2, and 3.

## 5. Retain Cycle Prevention
Created a `DataManager` class that stores a completion closure. Used `[weak self]` in the capture list to avoid a strong reference cycle.

The `deinit` message confirmed that the object was released after its strong reference was set to `nil`.

## 6. Optional Extension: Retry Helper
Created a retry helper that accepts an operation closure and attempts it up to a specified number of times. The simulated operation succeeded on the second attempt.

## Conclusion
Closures support reusable and flexible code. They can capture local variables and object references. Using `[weak self]` helps prevent retain cycles when an object stores a closure that refers to itself.

## Execution Status
The complete Swift program was executed successfully using JDoodle Swift Compiler.
