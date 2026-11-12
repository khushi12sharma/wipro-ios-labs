
import Foundation

// 1. ARRAY
print("===== ARRAY OPERATIONS =====")

var courses = ["Java", "Python", "Swift", "JavaScript"]

print("Original:", courses)

courses.append("Kotlin")
print("After Adding:", courses)

courses.removeAll { $0 == "Python" }
print("After Removing Python:", courses)

print("Sorted:", courses.sorted())

let filtered = courses.filter { $0.contains("a") }
print("Courses containing a:", filtered)

print("Search Swift:", courses.contains("Swift"))

// 2. SET
print("\n===== SET OPERATIONS =====")

let studentIDs = [101, 102, 103, 101, 104, 102, 105]
let uniqueIDs = Set(studentIDs)

print("Original IDs:", studentIDs)
print("Unique IDs:", uniqueIDs.sorted())
print("Unique Count:", uniqueIDs.count)

// 3. DICTIONARY
print("\n===== DICTIONARY OPERATIONS =====")

let marks = [
    101: 85,
    102: 92,
    103: 45,
    104: 76,
    105: 55
]

if let topper = marks.max(by: { $0.value < $1.value }) {
    print("Topper ID:", topper.key)
    print("Topper Marks:", topper.value)
}

print("Students below 60 marks:")

for (id, mark) in marks.filter({ $0.value < 60 }).sorted(by: { $0.key < $1.key }) {
    print("ID:", id, "Marks:", mark)
}

// 4. ENUM AND SWITCH
print("\n===== ENUM AND SWITCH =====")

enum TaskPriority {
    case low, medium, high
}

let priority = TaskPriority.high

switch priority {
case .low:
    print("Low Priority")
case .medium:
    print("Medium Priority")
case .high:
    print("High Priority")
}

// 5. ENUM WITH ASSOCIATED VALUES
print("\n===== API RESULT ENUM =====")

enum APIResult {
    case success(data: String)
    case failure(message: String)
}

let result = APIResult.success(data: "Courses loaded successfully")

switch result {
case .success(let data):
    print("Success:", data)
case .failure(let message):
    print("Error:", message)
}
