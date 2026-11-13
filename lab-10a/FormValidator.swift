
import Foundation

public struct FormValidator {

    public init() {}

    public func isValidName(_ name: String) -> Bool {
        return !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    public func isValidEmail(_ email: String) -> Bool {
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)

        return trimmedEmail.contains("@") &&
               trimmedEmail.contains(".") &&
               !trimmedEmail.contains(" ")
    }
}
