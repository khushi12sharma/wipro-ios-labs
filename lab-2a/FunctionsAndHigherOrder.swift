
import Foundation

// MARK: - R1: REUSABLE FUNCTIONS

func calculateMean(of numbers: [Double]) -> Double {
    guard !numbers.isEmpty else { return 0 }
    return numbers.reduce(0, +) / Double(numbers.count)
}

func findMaximum(in numbers: [Int]) -> Int? {
    return numbers.max()
}

func isValidEmailLike(_ email: String) -> Bool {
    return email.contains("@") &&
           email.contains(".") &&
           !email.contains(" ")
}

func formatDisplayName(_ name: String) -> String {
    return name
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .split(whereSeparator: { $0.isWhitespace })
        .map { $0.capitalized }
        .joined(separator: " ")
}

print("===== REUSABLE FUNCTIONS =====")
print("Mean:", calculateMean(of: [70, 80, 90]))
print("Maximum:", findMaximum(in: [45, 92, 78]) ?? 0)
print("Valid Email:", isValidEmailLike("student@example.com"))
print("Display Name:", formatDisplayName("  khushi sharma  "))


// MARK: - R2: TRANSACTIONS

struct Transaction {
    let title: String
    let amount: Double
    let isExpense: Bool
    let category: String
}

let transactions = [
    Transaction(title: "Food", amount: 250, isExpense: true, category: "Food"),
    Transaction(title: "Salary", amount: 5000, isExpense: false, category: "Income"),
    Transaction(title: "Travel", amount: 150, isExpense: true, category: "Travel"),
    Transaction(title: "Books", amount: 300, isExpense: true, category: "Education"),
    Transaction(title: "Snacks", amount: 100, isExpense: true, category: "Food")
]

func calculateTotalExpenses(from transactions: [Transaction]) -> Double {
    let expenses = transactions.filter { $0.isExpense }
    let amounts = expenses.map { $0.amount }
    return amounts.reduce(0, +)
}

print("\n===== TRANSACTION OPERATIONS =====")

let expenses = transactions.filter { $0.isExpense }
print("Expense Count:", expenses.count)

let expenseNames = expenses.map { $0.title }
print("Expense Names:", expenseNames)

let totalExpenses = calculateTotalExpenses(from: transactions)
print("Total Expenses:", totalExpenses)


// MARK: - OPTIONAL EXTENSION: CATEGORY REPORT

func categorySpending(from transactions: [Transaction]) -> [(String, Double)] {
    let categories = Set(
        transactions
            .filter { $0.isExpense }
            .map { $0.category }
    )

    return categories.sorted().map { category in
        let amounts = transactions
            .filter { $0.isExpense && $0.category == category }
            .map { $0.amount }

        let total = amounts.reduce(0, +)
        return (category, total)
    }
}

print("\n===== CATEGORY SPENDING =====")

for (category, total) in categorySpending(from: transactions) {
    print(category + ":", total)
}


// MARK: - R3: STUDENT SORTING

struct Student {
    let name: String
    let marks: Int
}

func sortStudents(_ students: [Student]) -> [Student] {
    return students.sorted {
        if $0.marks == $1.marks {
            return $0.name < $1.name
        }
        return $0.marks > $1.marks
    }
}

let students = [
    Student(name: "Riya", marks: 85),
    Student(name: "Aman", marks: 92),
    Student(name: "Khushi", marks: 85),
    Student(name: "Neha", marks: 78)
]

print("\n===== SORTED STUDENTS =====")

for student in sortStudents(students) {
    print(student.name, "-", student.marks)
}


// MARK: - R4: LOOP VS HIGHER-ORDER FUNCTIONS

func loopTotalExpenses(from transactions: [Transaction]) -> Double {
    var total = 0.0

    for transaction in transactions {
        if transaction.isExpense {
            total += transaction.amount
        }
    }

    return total
}

print("\n===== APPROACH COMPARISON =====")
print("Loop Total:", loopTotalExpenses(from: transactions))
print("Higher-Order Total:", calculateTotalExpenses(from: transactions))


// MARK: - R5: FUNCTION TESTS

print("\n===== FUNCTION TESTS =====")

print("Empty Mean:", calculateMean(of: []))
print("Empty Maximum:", findMaximum(in: []) ?? -1)
print("Invalid Email:", isValidEmailLike("studentexample.com"))
print("Trimmed Name:", formatDisplayName("  aman   kumar "))
