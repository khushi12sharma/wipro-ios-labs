
import Foundation

// Student marks dictionary
let studentMarks = [
    101: 85,
    102: 92,
    103: 76,
    104: 88
]

// 1. Function returning optional marks
func getMarks(for studentID: Int) -> Int? {
    return studentMarks[studentID]
}

print("===== OPTIONAL RESULT =====")

// 2. if let
if let marks = getMarks(for: 102) {
    print("Student 102 Marks:", marks)
} else {
    print("Student not found")
}

// 3. guard let
func displayMarks(for studentID: Int) {
    guard let marks = getMarks(for: studentID) else {
        print("No marks found for Student:", studentID)
        return
    }

    print("Student \(studentID) Marks:", marks)
}

print("\n===== GUARD LET =====")
displayMarks(for: 101)
displayMarks(for: 999)

// 4. Optional chaining
struct Student {
    let name: String
    let email: String?
}

let student: Student? = Student(
    name: "Khushi",
    email: "khushi@example.com"
)

print("\n===== OPTIONAL CHAINING =====")
if let email = student?.email {
    print("Student Email:", email)
} else {
    print("Email not available")
}

// 5. Nil-coalescing operator
let missingMarks = getMarks(for: 999) ?? 0

print("\n===== NIL COALESCING =====")
print("Missing Student Marks:", missingMarks)

// 6. Empty text field handling
print("\n===== EMPTY TEXT HANDLING =====")

let userInput = "   "
let cleanedInput = userInput.trimmingCharacters(in: .whitespaces)

if cleanedInput.isEmpty {
    print("Please enter your name")
} else {
    print("Name:", cleanedInput)
}

// 7. No force unwraps
print("\n===== SAFE UNWRAPPING =====")
let safeMarks = getMarks(for: 103)

if let value = safeMarks {
    print("Safely retrieved marks:", value)
} else {
    print("Marks unavailable")
}
