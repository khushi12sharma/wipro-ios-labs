
# Lab 4B: App, Scene, and View Lifecycles

## Objective

Understand the lifecycle events of an iOS application, its scenes, and individual views. Learn where to perform lightweight tasks and avoid placing unrelated work inside lifecycle callbacks.

## Application Overview

This project demonstrates app lifecycle events, scene lifecycle events, and view lifecycle callbacks using a two-screen UIKit application.

Users can navigate from the First Screen to the Second Screen and return using navigation controls.

## Requirements and Implementation

### R1: App and Scene Lifecycle Logging

Lifecycle events are logged using AppDelegate and SceneDelegate.

AppDelegate events:
- application(_:didFinishLaunchingWithOptions:)
- applicationDidEnterBackground(_:)
- applicationWillEnterForeground(_:)

SceneDelegate events:
- scene(_:willConnectTo:options:)
- sceneDidBecomeActive(_:)
- sceneWillResignActive(_:)
- sceneDidEnterBackground(_:)
- sceneWillEnterForeground(_:)

### R2: View Lifecycle Logging

The view controllers log these callbacks:

- viewDidLoad()
- viewWillAppear(_:)
- viewDidAppear(_:)
- viewWillDisappear(_:)
- viewDidDisappear(_:)

These logs help understand when a screen is loaded, displayed, and removed from the visible interface.

### R3: Two-Screen Navigation

The application contains two screens:

1. First Screen
2. Second Screen

A navigation controller manages movement between the two screens.

When the user opens the second screen and returns to the first screen, the corresponding view lifecycle events are recorded.

### R4: Lightweight Refresh

A lightweight refresh operation is performed inside viewWillAppear(_:).

This callback is appropriate because the screen is about to become visible. It allows the application to refresh information before the user sees the screen.

Heavy operations and unrelated work should not be placed inside lifecycle callbacks.

### R5: Repeated View Appearance

A view does not necessarily appear only once.

For example, when the user navigates from the first screen to the second screen and then returns, the first screen's appearance callbacks execute again.

viewDidLoad() generally runs when the view is first loaded, whereas viewWillAppear(_:) and viewDidAppear(_:) can execute multiple times.

## Sample Event Log

```text
First Screen: viewDidLoad
First Screen: viewWillAppear
First Screen: viewDidAppear

Second Screen: viewDidLoad
First Screen: viewWillDisappear
Second Screen: viewWillAppear

First Screen: viewDidDisappear
Second Screen: viewDidAppear

Second Screen: viewWillDisappear
First Screen: viewWillAppear

Second Screen: viewDidDisappear
First Screen: viewDidAppear
```

Note: Actual callback ordering and app/scene events should be recorded from a running application. This is an illustrative navigation log.

## Architecture

- AppDelegate: Handles application-level lifecycle events.
- SceneDelegate: Handles scene-level lifecycle events.
- FirstViewController: Displays the first screen and logs view lifecycle events.
- SecondViewController: Displays the second screen and logs view lifecycle events.
- LifecycleLogger: Provides a common logging utility.

## Testing and Evidence

The following evidence is required:

1. Source code for app, scene, and view lifecycle logging.
2. Event log from navigation between both screens.
3. Screenshot of the two-screen application.
4. Explanation of repeated view appearance behaviour.

## Conclusion

This lab demonstrates the difference between application, scene, and view lifecycles. It also explains how navigation triggers repeated view appearance callbacks and why lightweight refresh operations should be placed in appropriate lifecycle methods.

## Platform Limitation

The UIKit application requires Xcode on macOS for actual execution and screenshots. Source code and sample event logs alone do not represent a successful UI test.
