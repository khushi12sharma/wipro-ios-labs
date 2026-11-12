
import Foundation

struct FormValidator {

    static func validateName(_ name: String) -> Bool {
        let trimmedName = name.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        return !trimmedName.isEmpty
    }

    static func validateEmail(_ email: String) -> Bool {
        let trimmedEmail = email.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        let emailPattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#

        return trimmedEmail.range(
            of: emailPattern,
            options: .regularExpression
        ) != nil
    }

    static func validateForm(
        name: String,
        email: String
    ) -> Bool {

        return validateName(name) &&
               validateEmail(email)
    }
}
