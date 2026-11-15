
# Course Planner - Test Evidence

## 1. Unit Testing

Framework: XCTest

A total of 13 unit test cases have been written.

| No. | Test Case | Expected Result |
|---|---|---|
| 1 | Valid name | True |
| 2 | Empty name | False |
| 3 | Name with spaces only | False |
| 4 | Valid email | True |
| 5 | Email without @ symbol | False |
| 6 | Email without dot | False |
| 7 | Email containing spaces | False |
| 8 | Registration with invalid name | Validation error |
| 9 | Initial course count | 3 courses |
| 10 | Toggle favourite | Favourite status updates |
| 11 | Toggle completed | Completion status updates |
| 12 | Completed course count | Count updates |
| 13 | Search courses | Matching courses are returned |

## 2. Test Execution Status

- Test source code: Written
- Number of test cases: 13
- Xcode test execution: Pending
- Passing test screenshot: Pending

## 3. Manual Testing Checklist

- [ ] Course list displays courses.
- [ ] Search filters courses.
- [ ] Empty search message appears.
- [ ] Course detail screen opens.
- [ ] Favourite status updates.
- [ ] Completion progress updates.
- [ ] Registration rejects empty name.
- [ ] Registration rejects invalid email.
- [ ] Registration displays success message.

## 4. Evidence

Actual screenshots and test-run results must be added after running the application and tests in Xcode.

No test execution or screenshot is claimed until verified.
