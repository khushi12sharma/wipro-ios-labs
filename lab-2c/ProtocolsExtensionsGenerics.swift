
import Foundation

// MARK: - R1: DISPLAYABLE PROTOCOL

protocol Displayable {
    var displayText: String { get }
}

struct Student: Displayable {
    let name: String
    let marks: Int

    var displayText: String {
        return "Student: \(name), Marks: \(marks)"
    }
}

struct Course: Displayable {
    let name: String
    let duration: Int

    var displayText: String {
        return "Course: \(name), Duration: \(duration) days"
    }
}

print("===== DISPLAYABLE PROTOCOL =====")

let student = Student(name: "Khushi", marks: 90)
let course = Course(name: "Swift", duration: 30)

print(student.displayText)
print(course.displayText)


// MARK: - R2: STRING EXTENSION

extension String {
    var wordCount: Int {
        return self.split(whereSeparator: { $0.isWhitespace }).count
    }

    func reversedText() -> String {
        return String(self.reversed())
    }
}

print("\n===== STRING EXTENSION =====")

let message = "Swift is easy"

print("Word Count:", message.wordCount)
print("Reversed:", message.reversedText())


// MARK: - R3: GENERIC STACK

struct Stack<T> {
    private var items: [T] = []

    var isEmpty: Bool {
        return items.isEmpty
    }

    mutating func push(_ item: T) {
        items.append(item)
    }

    mutating func pop() -> T? {
        return items.popLast()
    }

    func peek() -> T? {
        return items.last
    }
}

print("\n===== GENERIC STACK: INT =====")

var intStack = Stack<Int>()

intStack.push(10)
intStack.push(20)
intStack.push(30)

print("Top Element:", intStack.peek() ?? -1)
print("Removed:", intStack.pop() ?? -1)
print("New Top:", intStack.peek() ?? -1)
print("Is Empty:", intStack.isEmpty)


print("\n===== GENERIC STACK: STRING =====")

var stringStack = Stack<String>()

stringStack.push("Java")
stringStack.push("Swift")

print("Top Element:", stringStack.peek() ?? "None")
print("Removed:", stringStack.pop() ?? "None")
print("New Top:", stringStack.peek() ?? "None")


// MARK: - R4: GENERIC FUNCTION WITH PROTOCOL CONSTRAINT

func displayItems<T: Displayable>(_ items: [T]) {
    for item in items {
        print(item.displayText)
    }
}

print("\n===== GENERIC DISPLAY FUNCTION =====")

displayItems([student])
displayItems([course])

// Valid: Student and Course conform to Displayable.
// Invalid: displayItems([42])
// Int does not conform to Displayable, so this call will not compile.


// MARK: - OPTIONAL EXTENSION: CUSTOM STACK PROTOCOL

protocol StackProtocol {
    associatedtype Element

    mutating func push(_ item: Element)
    mutating func pop() -> Element?
    func peek() -> Element?
    var isEmpty: Bool { get }
}

extension Stack: StackProtocol {}

print("\n===== STACK PROTOCOL TEST =====")

var protocolStack = Stack<Int>()

protocolStack.push(100)
protocolStack.push(200)

print("Protocol Stack Top:", protocolStack.peek() ?? -1)
print("Protocol Stack Removed:", protocolStack.pop() ?? -1)


// MARK: - R5: EXTENSION VS NEW TYPE

/*
 Extensions add computed properties and methods
 to existing types.

 Extensions cannot add stored instance properties.
 If a feature requires its own stored state,
 a new struct or class should be created.
*/


// MARK: - ASSERTION CHECKS

print("\n===== ASSERTION CHECKS =====")

assert(student.displayText == "Student: Khushi, Marks: 90")
print("Check 1 Passed: Student Displayable")

assert(course.displayText == "Course: Swift, Duration: 30 days")
print("Check 2 Passed: Course Displayable")

assert(message.wordCount == 3)
print("Check 3 Passed: String Word Count")

assert(message.reversedText() == "ysae si tfiwS")
print("Check 4 Passed: String Reversal")

assert(intStack.peek() == 20)
print("Check 5 Passed: Integer Stack Peek")

assert(stringStack.peek() == "Java")
print("Check 6 Passed: String Stack Peek")

assert(protocolStack.peek() == 100)
print("Check 7 Passed: Stack Protocol")

assert(!protocolStack.isEmpty)
print("Check 8 Passed: Stack Is Not Empty")

print("\nAll 8 assertion checks passed!")
