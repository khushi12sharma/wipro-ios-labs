
import Foundation

// R1: STRUCT - VALUE TYPE
struct Course {
    var name: String
    var duration: Int
}

// CLASS - REFERENCE TYPE
class CourseManager {
    var managerName: String

    init(managerName: String) {
        self.managerName = managerName
    }
}

print("===== VALUE TYPE: STRUCT =====")

var course1 = Course(name: "Swift", duration: 30)
var course2 = course1

course2.name = "iOS Development"

print("Original Course:", course1.name)
print("Copied Course:", course2.name)

print("\n===== REFERENCE TYPE: CLASS =====")

var manager1 = CourseManager(managerName: "Khushi")
var manager2 = manager1

manager2.managerName = "Updated Manager"

print("Manager 1:", manager1.managerName)
print("Manager 2:", manager2.managerName)


// R3: RELATED REFERENCE TYPES
class Teacher {
    let name: String
    weak var classroom: Classroom?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Teacher released:", name)
    }
}

class Classroom {
    let roomNumber: Int
    var teacher: Teacher?

    init(roomNumber: Int) {
        self.roomNumber = roomNumber
    }

    deinit {
        print("Classroom released:", roomNumber)
    }
}

print("\n===== WEAK REFERENCE =====")

var classroom: Classroom? = Classroom(roomNumber: 101)
var teacher: Teacher? = Teacher(name: "Amit")

classroom?.teacher = teacher
teacher?.classroom = classroom

print("Classroom:", classroom?.roomNumber ?? 0)
print("Teacher:", classroom?.teacher?.name ?? "Not assigned")

teacher = nil
classroom = nil


// R4: STRONG REFERENCE CYCLE
class ClosureOwner {
    let name: String
    var onUpdate: (() -> Void)?

    init(name: String) {
        self.name = name
        print("Owner created:", name)
    }

    func createStrongCycle() {
        onUpdate = {
            print("Strong closure:", self.name)
        }
    }

    func breakCycle() {
        onUpdate = nil
        print("Strong cycle broken")
    }

    func createSafeClosure() {
        onUpdate = { [weak self] in
            guard let self = self else {
                print("Owner no longer exists")
                return
            }

            print("Weak closure:", self.name)
        }
    }

    deinit {
        print("Owner released:", name)
    }
}

print("\n===== STRONG CYCLE AND FIX =====")

var owner: ClosureOwner? = ClosureOwner(name: "Course Owner")

owner?.createStrongCycle()
owner?.onUpdate?()

// Break the strong reference cycle
owner?.breakCycle()
owner = nil

print("\n===== WEAK CAPTURE =====")

var safeOwner: ClosureOwner? = ClosureOwner(name: "Safe Owner")

safeOwner?.createSafeClosure()
safeOwner?.onUpdate?()

safeOwner = nil


// R5: VALUE AND REFERENCE SEMANTICS
print("\n===== MEMORY CONCEPTS =====")
print("Structs use value semantics.")
print("Classes use reference semantics.")
print("ARC manages class instance memory.")
print("Weak references do not keep instances alive.")
