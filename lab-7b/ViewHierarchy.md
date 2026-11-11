
# Lab 7B - View Hierarchy

## 1. Course List Screen

```text
Navigation Controller
        |
        v
CourseListViewController
        |
        v
      UIView
        |
        v
    UITableView
        |
        v
   UITableViewCell
        |
        v
  Content Configuration
        |
        v
 Course Name and Duration
```

## 2. Course Detail Screen

```text
Navigation Controller
        |
        v
CourseDetailViewController
        |
        v
      UIView
        |
        v
    UIStackView
        |
        |---- Name UILabel
        |
        |---- Duration UILabel
        |
        |---- Description UILabel
```

## Parent-Child Relationships

- Navigation Controller manages the screen navigation stack.
- CourseListViewController owns the list screen.
- The main UIView contains the UITableView.
- UITableView displays reusable UITableViewCell objects.
- CourseDetailViewController owns the detail screen.
- The detail screen's UIView contains a UIStackView.
- UIStackView arranges three UILabel objects vertically.

## Inspection Note

The hierarchy described above is based on the programmatic UI source code.

Actual inspection using Xcode's Debug View Hierarchy is pending because Xcode is unavailable.
