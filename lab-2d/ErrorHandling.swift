
import Foundation

// MARK: - R1: VALIDATION ERROR

enum ValidationError: Error {
    case emptyName
    case invalidMark
    case invalidID
}

// MARK: - STUDENT MODEL

struct Student {
    let id: Int
    let name: String
    let marks: Int
}

// MARK: - R2: THROWING REGISTRATION FUNCTION

func registerStudent(
    id: Int,
    name: String,
    marks: Int
) throws -> Student {

    if name.trimmingCharacters(in: .whitespaces).isEmpty {
        throw ValidationError.emptyName
    }

    if marks < 0 || marks > 100 {
        throw ValidationError.invalidMark
    }

    if id <= 0 {
        throw ValidationError.invalidID
    }

    return Student(id: id, name: name, marks: marks)
}

// MARK: - R3: ERROR HANDLING WITH DO-CATCH

func showRegistration(
    id: Int,
    name: String,
    marks: Int
) {
    do {
        let student = try registerStudent(
            id: id,
            name: name,
            marks: marks
        )

        print("Registration Successful:", student.name)

    } catch ValidationError.emptyName {
        print("Error: Student name cannot be empty")

    } catch ValidationError.invalidMark {
        print("Error: Marks must be between 0 and 100")

    } catch ValidationError.invalidID {
        print("Error: Student ID must be positive")

    } catch {
        print("Unknown error occurred")
    }
}

print("===== DO-CATCH ERROR HANDLING =====")

showRegistration(id: 101, name: "Khushi", marks: 90)
showRegistration(id: 102, name: "", marks: 85)
showRegistration(id: 103, name: "Aman", marks: 120)
showRegistration(id: 0, name: "Riya", marks: 80)


// MARK: - R4: OPTIONAL RETURN APPROACH

func findStudent(id: Int) -> Student? {
    if id == 101 {
        return Student(id: 101, name: "Khushi", marks: 90)
    }

    return nil
}

print("\n===== OPTIONAL RETURN =====")

if let student = findStudent(id: 101) {
    print("Student Found:", student.name)
} else {
    print("Student Not Found")
}

if let student = findStudent(id: 999) {
    print("Student Found:", student.name)
} else {
    print("Student Not Found")
}


// MARK: - RESULT APPROACH

func registerWithResult(
    id: Int,
    name: String,
    marks: Int
) -> Result<Student, ValidationError> {

    do {
        let student = try registerStudent(
            id: id,
            name: name,
            marks: marks
        )

        return .success(student)

    } catch let error as ValidationError {
        return .failure(error)

    } catch {
        return .failure(.invalidID)
    }
}

print("\n===== RESULT APPROACH =====")

let result = registerWithResult(
    id: 104,
    name: "Neha",
    marks: 88
)

switch result {
case .success(let student):
    print("Success:", student.name)

case .failure(let error):
    switch error {
    case .emptyName:
        print("Failure: Name is empty")
    case .invalidMark:
        print("Failure: Invalid marks")
    case .invalidID:
        print("Failure: Invalid ID")
    }
}


// MARK: - OPTIONAL EXTENSION: USER FRIENDLY RESULT

func registrationMessage(
    for result: Result<Student, ValidationError>
) -> String {

    switch result {
    case .success(let student):
        return "Welcome, \(student.name)! Registration completed."

    case .failure(let error):
        switch error {
        case .emptyName:
            return "Please enter your name."
        case .invalidMark:
            return "Please enter marks between 0 and 100."
        case .invalidID:
            return "Please enter a valid student ID."
        }
    }
}

print("\n===== USER FRIENDLY MESSAGE =====")

let failedResult = registerWithResult(
    id: 105,
    name: "   ",
    marks: 75
)

print(registrationMessage(for: failedResult))


// MARK: - R5: SAFE INPUT HANDLING

print("\n===== SAFE INPUT HANDLING =====")

let safeStudent = try? registerStudent(
    id: 106,
    name: "",
    marks: 80
)

if let student = safeStudent {
    print("Registered:", student.name)
} else {
    print("Registration could not be completed.")
}


// MARK: - ASSERTION CHECKS

print("\n===== ASSERTION CHECKS =====")

assert(
    (try? registerStudent(id: 201, name: "Aman", marks: 85)) != nil
)
print("Check 1 Passed: Valid Registration")

assert(
    (try? registerStudent(id: 202, name: "", marks: 85)) == nil
)
print("Check 2 Passed: Empty Name")

assert(
    (try? registerStudent(id: 203, name: "Riya", marks: 120)) == nil
)
print("Check 3 Passed: Invalid Marks")

assert(
    (try? registerStudent(id: 0, name: "Neha", marks: 80)) == nil
)
print("Check 4 Passed: Invalid ID")

assert(findStudent(id: 101) != nil)
print("Check 5 Passed: Optional Success")

assert(findStudent(id: 999) == nil)
print("Check 6 Passed: Optional Failure")

assert(
    registerWithResult(id: 204, name: "Khushi", marks: 95)
        .map { $0.name == "Khushi" } == .success(true)
)
print("Check 7 Passed: Result Success")

assert(
    registerWithResult(id: 205, name: "Aman", marks: 150)
        .map { $0.name == "Aman" } == .failure(.invalidMark)
)
print("Check 8 Passed: Result Failure")

print("\nAll 8 assertion checks passed!")
