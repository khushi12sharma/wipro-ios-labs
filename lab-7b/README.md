
# Lab 7B: Storyboards, View Hierarchy, and Navigation

## Objective
Build a two-screen UIKit application demonstrating navigation and view hierarchy.

## Application Features
- Course list screen
- Course detail screen
- Table view for displaying courses
- Selected course object passed between screens
- Navigation Controller push navigation
- Back navigation using pop
- Programmatic UIKit interface
- Auto Layout constraints

## Technologies Used
- Swift
- UIKit
- UIViewController
- UITableView
- UIStackView
- UILabel
- UINavigationController
- Auto Layout

## Project Files
- Course.swift
- CourseListViewController.swift
- CourseDetailViewController.swift
- NavigationFlow.md
- ViewHierarchy.md

## Navigation
The user selects a course from the list screen. The selected Course object is passed directly to CourseDetailViewController using its initializer.

## View Hierarchy
The list screen contains a UITableView inside its main UIView.

The detail screen contains a UIStackView with three UILabel elements.

## Safety and Code Quality
- No global variables are used for passing course data.
- No force-unwrapping of outlets.
- Optional navigation controller access is handled safely.

## Testing
Source code and navigation documentation are provided.

Actual Xcode execution, simulator screenshots and Debug View Hierarchy inspection are pending because Xcode is unavailable.

## Platform
iOS - UIKit
