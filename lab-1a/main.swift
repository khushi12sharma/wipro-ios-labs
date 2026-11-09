
import Foundation

func calculateGrade(average: Double) -> String {
    switch average {
    case 90...100:
        return "A"
    case 80..<90:
        return "B"
    case 70..<80:
        return "C"
    case 60..<70:
        return "D"
    case 50..<60:
        return "E"
    default:
        return "F"
    }
}

func main() {
    print("===== STUDENT GRADE CALCULATOR =====")

    print("Enter Student Name:")
    let studentName = readLine() ?? "Unknown"

    print("Enter Roll Number:")
    guard let rollNumber = Int(readLine() ?? "") else {
        print("Invalid Roll Number!")
        return
    }

    let subjects = [
        "English",
        "Mathematics",
        "Science",
        "Computer",
        "Social Studies"
    ]

    var marks: [Int] = []

    for subject in subjects {
        print("Enter marks in \(subject):")

        guard let mark = Int(readLine() ?? ""),
              mark >= 0 && mark <= 100 else {
            print("Invalid Marks! Enter between 0 and 100.")
            return
        }

        marks.append(mark)
    }

    print("Enter Attendance Percentage:")

    guard let attendance = Double(readLine() ?? ""),
          attendance >= 0 && attendance <= 100 else {
        print("Invalid Attendance!")
        return
    }

    let total = marks.reduce(0, +)
    let average = Double(total) / 5.0
    let percentage = Double(total) / 500.0 * 100.0

    print("\n===== ARITHMETIC OPERATORS =====")
    print("Addition:", 10 + 5)
    print("Subtraction:", 10 - 5)
    print("Multiplication:", 10 * 5)
    print("Division:", 10 / 5)
    print("Remainder:", 10 % 3)

    print("\n===== COMPARISON OPERATORS =====")
    print("Average >= 50:", average >= 50)
    print("Total == 500:", total == 500)

    let allSubjectsPassed = marks.allSatisfy { $0 >= 35 }
    let attendancePassed = attendance >= 75
    let eligible = allSubjectsPassed && attendancePassed

    print("\n===== LOGICAL OPERATORS =====")
    print("Eligible:", eligible)
    print("OR Example:", average >= 90 || attendance >= 75)
    print("NOT Example:", !eligible)

    var number = 10
    number += 5
    number -= 2
    number *= 2
    number /= 2

    print("\n===== COMPOUND ASSIGNMENT =====")
    print("Final Number:", number)

    let nickname: String? = nil
    let displayName = nickname ?? "Not Provided"

    print("\nNickname:", displayName)

    let result: String
    let grade: String

    if eligible {
        result = "PASS"
        grade = calculateGrade(average: average)
    } else {
        result = "FAIL"
        grade = "F"
    }

    print("\n===== STUDENT RESULT =====")
    print("Name:", studentName)
    print("Roll Number:", rollNumber)
    print("Total:", total, "/ 500")
    print(String(format: "Average: %.2f", average))
    print(String(format: "Percentage: %.2f%%", percentage))
    print("Attendance:", attendance, "%")
    print("Result:", result)
    print("Grade:", grade)
}

main()

