
import Foundation

struct ProfileValidator {

    static func validateName(_ name: String) -> Bool {
        return !name.trimmingCharacters(in: .whitespaces).isEmpty
    }

    static func validateEmail(_ email: String) -> Bool {
        let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#

        return email.range(
            of: pattern,
            options: .regularExpression
        ) != nil
    }

    static func validateCourse(_ course: String) -> Bool {
        return !course.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
