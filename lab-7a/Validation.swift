
import Foundation

struct ProfileValidator {

    static func validateName(_ name: String) -> Bool {
        return !name.trimmingCharacters(
            in: .whitespacesAndNewlines
        ).isEmpty
    }

    static func validateEmail(_ email: String) -> Bool {

        let trimmedEmail = email.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#

        return trimmedEmail.range(
            of: pattern,
            options: .regularExpression
        ) != nil
    }

    static func validateCourse(_ course: String) -> Bool {
        return !course.trimmingCharacters(
            in: .whitespacesAndNewlines
        ).isEmpty
    }
}
