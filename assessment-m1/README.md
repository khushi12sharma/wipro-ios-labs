
# Milestone 1 – Swift Foundations

## Objective
To demonstrate fundamental Swift programming concepts through practical implementations.

## Requirements
1. Gradebook using arrays, dictionaries and optionals.
2. Generic Stack using two element types.
3. Retain cycle identification and correction.
4. Throwing validation function with error handling.
5. Viva preparation covering important Swift concepts.

## R1 - Gradebook
Implemented a student gradebook using dictionaries and collections.

Features:
- Store student marks for multiple subjects.
- Calculate total and average marks.
- Add new students.
- Handle missing students safely using guard let.
- Handle optional values using nil coalescing.

## R2 - Generic Stack
Created a generic Stack using Swift generics.

Implemented operations:
- push(): Adds an element.
- pop(): Removes the top element.
- peek(): Returns the top element.
- isEmpty: Checks whether the stack is empty.

Demonstrated the Stack using Integer and String data types.

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

## R5 - Viva Questions and Answers

### 1. Difference between Struct and Class
Struct is a value type, whereas Class is a reference type.

Structs are copied when assigned to another variable, while classes share references to the same object.

### 2. Difference between Protocol and Inheritance
A protocol defines rules or requirements that a type must follow.

Inheritance allows a class to acquire properties and methods from another class.

### 3. What is Map?
Map transforms each element of a collection into a new value.

### 4. What is Filter?
Filter returns only the elements that satisfy a given condition.

### 5. What is Reduce?
Reduce combines all elements of a collection into a single value.

Example:
- Map: Convert marks into strings.
- Filter: Find marks greater than 80.
- Reduce: Calculate the total of all marks.

## Execution
The Swift source code can be tested using JDoodle or another Swift-compatible environment.

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

## Conclusion
This milestone demonstrates Swift fundamentals through practical implementations of collections, generics, memory management, error handling and important programming concepts.
