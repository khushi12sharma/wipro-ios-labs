
# Lab 7B - Navigation Flow Diagram

## Application Navigation

```text
        App Launch
            |
            v
   Navigation Controller
            |
            v
   Course List Screen
            |
            v
    Select a Course
            |
            v
  Pass Selected Course Object
            |
            v
  Course Detail Screen
            |
            v
       Back Button
            |
            v
    Course List Screen
```

## Navigation Explanation

1. The application starts with a Navigation Controller.
2. The Course List screen displays available courses.
3. The user selects a course from the table view.
4. The selected Course model object is passed to the detail controller.
5. Navigation Controller pushes the Course Detail screen.
6. The back button pops the detail screen and returns to the course list.

## Navigation Method

- UINavigationController
- pushViewController()
- Navigation bar back button
- popViewController()
