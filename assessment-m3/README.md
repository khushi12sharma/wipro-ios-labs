
# Milestone 3: Networking and UIKit

## Objective
Build a UIKit application demonstrating form validation, networking, JSON decoding and navigation.

## Requirements
1. UIKit form with validation and Auto Layout.
2. Fetch JSON data using URLSession.
3. Decode API response using Codable models.
4. Display loading, empty and failure states.
5. Navigate from a user list to a detail screen.
6. Explain UIKit and networking concepts for viva.

## Technologies
- Swift
- UIKit
- URLSession
- Codable
- Auto Layout
- UITableView
- UINavigationController

## Project Files

| File | Description |
|---|---|
| README.md | Project overview |
| User.swift | Codable user models |
| APIService.swift | API networking and JSON decoding |
| Validation.swift | Form validation |
| AssessmentViewController.swift | Main form and user list |
| UserDetailViewController.swift | User detail screen |
| NavigationSetup.swift | Navigation controller setup |
| VivaNotes.md | Viva preparation |
| TestCases.md | Test cases and expected results |

## API Used
https://dummyjson.com/users

## Testing Status
Source code and documentation have been prepared on Windows.

Actual UIKit execution, simulator testing and visual verification have not been performed because macOS and Xcode are unavailable.

## Navigation
The main screen is intended to be embedded inside a UINavigationController to support navigation to the user detail screen.
