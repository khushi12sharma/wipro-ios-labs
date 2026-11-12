# Lab 2C – Protocols, Extensions, and Generics

## Objective
To understand Swift protocols, extensions, generics, and protocol constraints through practical examples.

## 1. Displayable Protocol
Created a `Displayable` protocol with a `displayText` property.

- `Student` conforms to Displayable.
- `Course` conforms to Displayable.
- Both types provide their own display information.

## 2. String Extension
Extended the existing String type with:
- `wordCount`: Returns the number of words.
- `reversedText()`: Returns the reversed string.

## 3. Generic Stack
Created a generic `Stack<T>` structure with:
- `push()` – Adds an element.
- `pop()` – Removes and returns the top element.
- `peek()` – Returns the top element without removing it.
- `isEmpty` – Checks whether the stack is empty.

Tested with both Integer and String values.

## 4. Protocol-Constrained Generic Function
Created `displayItems<T: Displayable>()` to display objects that conform to Displayable.

- Valid use: Student and Course.
- Invalid use: Int, because Int does not conform to Displayable.

The invalid example is kept as a comment because executing it would cause a compile-time error.

## 5. Extension vs New Type
Extensions add computed properties and methods to existing types, but cannot add stored instance properties.

When a feature needs its own stored state, creating a new struct or class is more appropriate.

## 6. Assertion Checks
Eight assertion checks were executed successfully:
1. Student Displayable output.
2. Course Displayable output.
3. String word count.
4. String reversal.
5. Integer Stack peek.
6. String Stack peek.
7. Stack protocol functionality.
8. Stack non-empty check.

## Result
The Swift program executed successfully in JDoodle. All 8 assertion checks passed.
