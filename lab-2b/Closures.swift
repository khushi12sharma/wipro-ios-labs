
import Foundation

// MARK: - R1: SORT STUDENTS USING A CLOSURE

struct Student {
    let name: String
    let marks: Int
}

let students = [
    Student(name: "Riya", marks: 85),
    Student(name: "Aman", marks: 92),
    Student(name: "Khushi", marks: 88),
    Student(name: "Neha", marks: 78)
]

// Closure sorts students by marks in descending order.
let sortedStudents = students.sorted {
    $0.marks > $1.marks
}

print("===== STUDENT SORTING =====")

for student in sortedStudents {
    print(student.name, "-", student.marks)
}


// MARK: - R2: COMPLETION CLOSURE

// completion is a closure parameter that receives a String.
func performOperation(completion: (String) -> Void) {
    print("\nOperation started")

    // Simulated operation
    let result = "Data loaded successfully"

    // Calling the completion closure after the operation.
    completion(result)
}

print("\n===== COMPLETION CLOSURE =====")

performOperation { message in
    print("Completion:", message)
}


// MARK: - R3: TRAILING CLOSURE AND SHORTHAND ARGUMENTS

func calculate(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

print("\n===== TRAILING CLOSURE =====")

// Shorthand argument names: $0 and $1
let sum = calculate(10, 20) {
    $0 + $1
}

print("Sum using shorthand:", sum)

// Same example using explicit parameter names.
let difference = calculate(30, 10) { firstNumber, secondNumber in
    firstNumber - secondNumber
}

print("Difference using explicit names:", difference)


// MARK: - R4: COUNTER CLOSURE AND CAPTURED STATE

func makeCounter() -> () -> Int {
    var count = 0

    // The closure captures and retains access to count.
    return {
        count += 1
        return count
    }
}

print("\n===== COUNTER CLOSURE =====")

let counter = makeCounter()

print("Count:", counter())
print("Count:", counter())
print("Count:", counter())


// MARK: - R5: AVOIDING RETAIN CYCLES

class DataManager {
    let name: String

    // The object stores this closure.
    var onComplete: (() -> Void)?

    init(name: String) {
        self.name = name
        print("DataManager created:", name)
    }

    func setupCompletion() {
        // [weak self] prevents the closure from strongly retaining self.
        onComplete = { [weak self] in
            guard let self = self else {
                print("DataManager no longer exists")
                return
            }

            print("Completed for:", self.name)
        }
    }

    deinit {
        print("DataManager released:", name)
    }
}

print("\n===== WEAK SELF CAPTURE =====")

var manager: DataManager? = DataManager(name: "Student Data")

manager?.setupCompletion()
manager?.onComplete?()

// Releasing the strong reference allows ARC to release the instance.
manager = nil


// MARK: - OPTIONAL EXTENSION: RETRY HELPER

func retryOperation(
    maxAttempts: Int,
    operation: () -> Bool
) -> Bool {

    for attempt in 1...max(1, maxAttempts) {
        print("Attempt:", attempt)

        if operation() {
            print("Operation successful")
            return true
        }

        print("Operation failed")
    }

    print("All attempts completed")
    return false
}

print("\n===== RETRY HELPER =====")

var attempts = 0

let success = retryOperation(maxAttempts: 3) {
    attempts += 1
    return attempts == 2
}

print("Final Result:", success)
