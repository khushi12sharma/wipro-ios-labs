
import Foundation

public struct GradeCalculator {

    public init() {}

    public func calculateGrade(marks: Int) -> String {
        guard marks >= 0 && marks <= 100 else {
            return "Invalid"
        }

        if marks >= 90 {
            return "A"
        } else if marks >= 75 {
            return "B"
        } else if marks >= 60 {
            return "C"
        } else if marks >= 40 {
            return "D"
        } else {
            return "F"
        }
    }
}
