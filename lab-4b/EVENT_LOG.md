# Lab 4B: App, Scene, and View Lifecycles

## 1. Objective
To understand how app, scene, and view controller lifecycle methods work in a UIKit application.

## 2. Expected Event Log

The following is the expected callback sequence when navigating between two screens. It is illustrative and has not been captured from an actual Xcode runtime.

### App Launch
- App: didFinishLaunching
- Scene: willConnect
- First Screen: viewDidLoad
- First Screen: viewWillAppear
- First Screen: Lightweight refresh
- First Screen: viewDidAppear
- Scene: didBecomeActive

### Navigate to Second Screen
- First Screen: viewWillDisappear
- Second Screen: viewDidLoad
- Second Screen: viewWillAppear
- First Screen: viewDidDisappear
- Second Screen: viewDidAppear

### Return to First Screen
- Second Screen: viewWillDisappear
- First Screen: viewWillAppear
- First Screen: Lightweight refresh
- Second Screen: viewDidDisappear
- First Screen: viewDidAppear

## 3. Lifecycle Explanation

- `viewDidLoad`: Called after the view is loaded into memory.
- `viewWillAppear`: Called before the view becomes visible.
- `viewDidAppear`: Called after the view becomes visible.
- `viewWillDisappear`: Called before the view disappears.
- `viewDidDisappear`: Called after the view disappears.

## 4. Refresh Action

A lightweight refresh action is placed inside `viewWillAppear()` of FirstViewController.

This is appropriate because the screen may appear again after navigating back from another screen. Heavy tasks should not be performed directly inside this callback.

## 5. Repeated Appearance Behaviour

`viewDidLoad()` generally runs once for a loaded view controller instance. However, appearance callbacks can run multiple times when the user navigates between screens.

## 6. Testing Status

- Two-screen UIKit source code: Created.
- Lifecycle logging statements: Added.
- Expected navigation sequence: Documented.
- Actual runtime log: Pending Xcode execution.
- Two-screen app screenshot: Pending Xcode execution.

**Platform note:** UIKit applications require Xcode on macOS for actual execution and screenshots.
