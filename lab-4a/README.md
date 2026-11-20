
# Lab 4A: MVC and MVVM Architecture

## Objective
Build a Task List application using MVC and MVVM architecture. Separate UI, application state, and business logic to improve code organization and testability.

## Application Features
- Add a new task.
- Mark a task as completed.
- Delete a task.
- Filter tasks by All, Pending, and Completed.
- Validate task titles and reject empty input.

## Project Structure

```text
lab-4a/
├── README.md
├── ARCHITECTURE.md
├── COMPARISON.md
├── MVC/
│   ├── Task.swift
│   ├── TaskModel.swift
│   └── TaskViewController.swift
└── MVVM/
    ├── MVVMTaskViewModel.swift
    ├── TaskListViewController.swift
    └── TaskViewModelTests.swift
```

## MVC Implementation

MVC stands for Model-View-Controller.

- Model: Task.swift and TaskModel.swift store task data and handle task operations.
- View: UIKit controls display the task list and accept user input.
- Controller: TaskViewController.swift connects the model with the UI and handles user interactions.

## MVVM Implementation

MVVM stands for Model-View-ViewModel.

- Model: MVVMTask represents an individual task.
- ViewModel: TaskViewModel.swift handles task creation, validation, completion, deletion, and filtering.
- View: TaskListViewController.swift displays information and forwards user actions to the ViewModel.

## Validation and Business Logic

Task title validation and filtering are handled outside the UI layer.

The ViewModel exposes visibleTasks, which returns tasks according to the selected filter.

## Testing

TaskViewModelTests.swift contains unit tests for:
- Adding a valid task.
- Rejecting an empty task title.
- Completing a task.
- Deleting a task.
- Filtering pending and completed tasks.

## Architecture Comparison

See COMPARISON.md for a detailed comparison of MVC and MVVM.

## Architecture Diagram

See ARCHITECTURE.md for the architecture flow.

## Platform and Limitations

The interface is implemented using UIKit. Running the actual iOS application requires Xcode on macOS.

The Foundation-based ViewModel logic can be checked independently of the UI.

## Conclusion

This lab demonstrates how MVC and MVVM separate responsibilities in an iOS application. MVVM makes business logic easier to test independently from the user interface.
```
