# Lab 1A – Test Cases

**Objective:** To verify student grade calculation, marks validation, attendance validation and pass/fail conditions.

| Test Case | Input | Expected Output |
|---|---|---|
| TC01 | Marks: 85, 90, 80, 90, 80; Attendance: 90 | PASS – Grade B |
| TC02 | Marks: 80, 80, 80, 80, 80; Attendance: 80 | PASS – Grade B |
| TC03 | Marks: 70, 70, 70, 70, 70; Attendance: 75 | PASS – Grade C |
| TC04 | Marks: 60, 60, 60, 60, 60; Attendance: 80 | PASS – Grade D |
| TC05 | Marks: 50, 50, 50, 50, 50; Attendance: 90 | PASS – Grade E |
| TC06 | Marks: 30, 80, 80, 80, 80; Attendance: 90 | FAIL – Grade F |
| TC07 | Marks: 100, 100, 100, 100, 100; Attendance: 100 | PASS – Grade A |
| TC08 | Valid marks; Attendance: 101 | Invalid Attendance |

## Conclusion

All eight test scenarios are defined to verify the program's calculations, grading logic and input validation.
