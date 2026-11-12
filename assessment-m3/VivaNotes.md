
# Milestone 3 Viva Notes

## 1. View Hierarchy

The main screen is managed by `AssessmentViewController`.

The view contains:
- Name and email text fields
- Submit button
- Status label
- Activity indicator
- Table view

The table view displays the list of users. When a user selects a row, the application opens `UserDetailViewController`.

A UINavigationController manages the navigation between screens.

## 2. Auto Layout

Auto Layout is used to arrange UI elements based on constraints.

In this project:
- NSLayoutConstraint.activate() activates constraints.
- Safe Area Layout Guide avoids overlapping system areas.
- Leading and trailing constraints maintain horizontal spacing.
- translatesAutoresizingMaskIntoConstraints is set to false when using Auto Layout.

## 3. URLSession

URLSession is used to communicate with web APIs.

The application uses URLSession.shared.data(from:) to fetch user data from the API.

The function uses async/await, so the network request does not block the main thread.

The HTTP response status code is checked before decoding the response.

## 4. Codable

Codable is a Swift type alias for Encodable and Decodable.

It helps convert JSON data into Swift models.

In this project:
- UserResponse represents the API response.
- User represents an individual user.
- JSONDecoder decodes the received JSON into Swift objects.

## 5. Loading, Empty and Failure States

The application handles different screen states:

- Loading: Shows an activity indicator while data is being fetched.
- Empty: Displays a message when no users are available.
- Failure: Displays an error message if the API request fails.
- Loaded: Displays the user list after successful decoding.

## 6. Main Thread Updates

UIKit updates should be performed on the main thread.

The project uses MainActor.run to update the user list and screen state after the network request.

## 7. Navigation

When a user selects a table row:
1. The selected User object is obtained.
2. A UserDetailViewController is created.
3. The selected user is passed to its initializer.
4. The navigation controller pushes the detail screen.

## Testing Note

These notes describe the source-code implementation. Actual UIKit execution and simulator testing have not been performed because macOS and Xcode are unavailable in the current environment.
