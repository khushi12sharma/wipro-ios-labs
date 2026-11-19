
import Foundation

// MARK: - GRADEBOOK

var gradebook: [Int: [String: Int]] = [
    101: [
        "English": 85,
        "Maths": 90,
        "Science": 80
    ],
    102: [
        "English": 75,
        "Maths": 80,
        "Science": 70
    ],
    103: [
        "English": 95,
        "Maths": 88,
        "Science": 92
    ]
]

// MARK: - DISPLAY STUDENT MARKS

func displayMarks(studentID: Int) {

    guard let marks = gradebook[studentID] else {
        print("Student not found!")
        return
    }

    print("\nStudent ID:", studentID)

    for (subject, mark) in marks {
        print("\(subject): \(mark)")
    }

    let total = marks.values.reduce(0, +)
    let average = Double(total) / Double(marks.count)

    print("Total:", total)
    print("Average:", average)
}

// MARK: - SAFE OPTIONAL HANDLING

func getMarks(studentID: Int) -> Int? {

    guard let marks = gradebook[studentID] else {
        return nil
    }

    return marks["English"]
}

// MARK: - ADD NEW STUDENT

gradebook[104] = [
    "English": 80,
    "Maths": 85,
    "Science": 90
]

// MARK: - DISPLAY RESULTS

print("===== STUDENT GRADEBOOK =====")

displayMarks(studentID: 101)
displayMarks(studentID: 102)
displayMarks(studentID: 104)

// MARK: - OPTIONAL RESULT

if let englishMarks = getMarks(studentID: 101) {
    print("\nEnglish Marks:", englishMarks)
} else {
    print("\nMarks not available")
}

// MARK: - MISSING STUDENT

displayMarks(studentID: 999)

let missingMarks = getMarks(studentID: 999) ?? 0
print("Missing Student Marks:", missingMarks)

// MARK: - GENERIC STACK

struct Stack<Element> {

    var items: [Element] = []

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element? {
        return items.popLast()
    }

    func peek() -> Element? {
        return items.last
    }

    var isEmpty: Bool {
        return items.isEmpty
    }
}

// MARK: - INTEGER STACK

print("\n===== INTEGER STACK =====")

var intStack = Stack<Int>()

intStack.push(10)
intStack.push(20)
intStack.push(30)

print("Top Element:", intStack.peek() ?? 0)
print("Removed Element:", intStack.pop() ?? 0)
print("New Top:", intStack.peek() ?? 0)
print("Is Empty:", intStack.isEmpty)

// MARK: - STRING STACK

print("\n===== STRING STACK =====")

var stringStack = Stack<String>()

stringStack.push("Swift")
stringStack.push("Java")
stringStack.push("Python")

print("Top Element:", stringStack.peek() ?? "No Element")
print("Removed Element:", stringStack.pop() ?? "No Element")
print("New Top:", stringStack.peek() ?? "No Element")
print("Is Empty:", stringStack.isEmpty)
