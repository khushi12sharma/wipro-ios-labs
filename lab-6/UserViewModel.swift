import SwiftUI

@MainActor
class UserViewModel: ObservableObject {

    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let userService = UserService()

    func loadUsers() async {

        isLoading = true
        errorMessage = nil

        do {
            users = try await userService.fetchUsers()

        } catch is CancellationError {
            errorMessage = "Request was cancelled."

        } catch let error as NetworkError {

            switch error {
            case .invalidURL:
                errorMessage = "Invalid API URL."
            case .invalidResponse:
                errorMessage = "Invalid server response."
            case .httpError(let code):
                errorMessage = "Server error: \(code)"
            case .decodingFailed:
                errorMessage = "Unable to decode user data."
            case .emptyResults:
                errorMessage = "No users found."
            case .networkFailed:
                errorMessage = "Network connection failed."
            }

        } catch {
            errorMessage = "Something went wrong."
        }

        isLoading = false
    }
}
