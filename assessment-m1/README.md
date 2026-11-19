
# Milestone 1 – Swift Foundations

## Objective
To demonstrate fundamental Swift programming concepts through practical implementations.

## Requirements

1. Gradebook using arrays, dictionaries and optionals.
2. Generic Stack using two element types.
3. Retain cycle identification and correction.
4. Throwing validation function with error handling.
5. Viva preparation covering important Swift concepts.

## Concepts Covered

- Arrays and Dictionaries
- Optionals
- Generics
- Structs and Classes
- ARC and Memory Management
- Weak References
- Error Handling
- Protocols
- Higher Order Functions

## Execution
The Swift source code can be tested using JDoodle or another Swift-compatible environment.

## Conclusion
This milestone demonstrates the understanding of Swift foundations and object-oriented programming concepts.
## R3 - Retain Cycle Fix

A retain cycle occurs when two class instances hold strong references to each other. ARC cannot release their memory.

In this implementation, Person strongly references Apartment, while Apartment weakly references Person.

The weak reference prevents the retain cycle because it does not increase the reference count.

The deinit methods confirm that both objects are successfully released from memory.


## R4 - Error Handling

A throwing validation function was created to validate student details.

Two custom errors were defined using an enum:

1. emptyName - when the student name is empty.
2. invalidMarks - when marks are below 0 or above 100.

The errors are generated using throw and handled using do-catch blocks.

Test cases:
- Valid student: Khushi, 90 marks.
- Empty student name.
- Invalid marks: 120.

## Conclusion

This milestone demonstrates Swift fundamentals, including
collections, optionals, generics, memory management,
error handling, protocols and higher-order functions.
