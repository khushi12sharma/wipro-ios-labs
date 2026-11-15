
import Foundation

struct FormValidator {

    static func validateName(_ name: String) -> Bool {
        return !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    static func validateEmail(_ email: String) -> Bool {
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)

        return trimmedEmail.contains("@") &&
               trimmedEmail.contains(".") &&
               !trimmedEmail.contains(" ")
    }

    static func validateRegistration(name: String, email: String) -> String? {
        guard validateName(name) else {
            return "Please enter your name."
        }

        guard validateEmail(email) else {
            return "Please enter a valid email."
        }

        return nil
    }
}
