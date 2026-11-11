
# Lab 7C: Lifecycle Observation Report

## 1. viewDidLoad()
This method is called after the view is loaded into memory.
It is used for one-time setup, such as creating controls,
setting properties and adding Auto Layout constraints.

## 2. viewWillAppear()
This method is called before the view becomes visible.
It can be used to refresh data whenever the screen appears.

## 3. viewDidAppear()
This method is called after the view becomes visible.
It can be used for tasks that should happen after presentation.

## 4. viewWillDisappear()
This method is called before the view disappears.
It can be used to prepare for leaving the screen.

## 5. viewDidDisappear()
This method is called after the view disappears.
It can be used for cleanup or stopping tasks.

## Setup and Refresh

One-time UI setup belongs in viewDidLoad().
Refreshing the summary when returning to the screen
can be done in viewWillAppear().

## Keyboard Observation

The name text field opens the keyboard when selected.
The screen layout should be checked when the keyboard
appears and disappears to ensure controls remain accessible.

## Testing Status

Lifecycle print statements are included in the source code.
Actual lifecycle logs and keyboard layout behavior have
not been verified because macOS and Xcode are unavailable.
