# Lab 2D – Error Handling Test Cases

| Test Case | Input | Expected Result | Actual Result |
|---|---|---|---|
| Valid Registration | ID: 101, Name: Khushi, Marks: 90 | Registration successful | Passed |
| Empty Name | ID: 102, Name: Empty, Marks: 85 | Empty name error | Passed |
| Invalid Marks | ID: 103, Name: Aman, Marks: 120 | Invalid marks error | Passed |
| Invalid ID | ID: 0, Name: Riya, Marks: 80 | Invalid ID error | Passed |
| Optional Success | ID: 101 | Student found | Passed |
| Optional Failure | ID: 999 | Student not found | Passed |
| Result Success | ID: 104, Name: Neha, Marks: 88 | Success result | Passed |
| Result Failure | ID: 205, Name: Aman, Marks: 150 | Failure result | Passed |
| Safe Invalid Input | Empty name | Friendly error message without crash | Passed |

## Summary

- Total test cases: 9
- Successful test cases: 9
- Failed test cases: 0

All test cases were verified using the JDoodle Swift compiler.
