# Lab 2A: Functions and Higher-Order Functions

## Objective
Decompose logic into reusable functions and understand the use of Swift higher-order functions.

## 1. Reusable Functions

Created reusable functions to:
- Calculate the mean of numbers.
- Find the maximum value.
- Validate email-like input.
- Format a display name.
- Calculate total expenses.

Clear parameter labels and return types were used to make functions easier to understand and reuse.

## 2. Higher-Order Functions

Used the following functions with transaction data:

- **filter:** Selected only expense transactions.
- **map:** Extracted transaction names and amounts.
- **reduce:** Calculated the total expense.

The total expense was 800.0.

## 3. Student Sorting

Students were sorted by marks in descending order. When two students had equal marks, their names were sorted alphabetically.

## 4. Loop-Based vs Higher-Order Approach

The loop-based approach uses an explicit `for` loop and an `if` condition to select expenses and calculate the total. It is straightforward and gives clear control over each step.

The higher-order approach uses `filter`, `map`, and `reduce` to express the same operations in a concise and readable way. It separates filtering, transformation, and calculation into distinct steps. For this example, both approaches produced the same total of 800.0. Higher-order functions are useful for expressing data-processing operations clearly, while loops can be easier to follow when the logic involves several conditions or complex steps.

## 5. Conclusion

This lab demonstrates reusable functions, parameter labels, return types, filtering, mapping, reducing, and sorting. Both loop-based and higher-order approaches were executed successfully using JDoodle Swift Compiler.

## Execution Status
The Swift program and listed test cases were executed successfully using JDoodle.
