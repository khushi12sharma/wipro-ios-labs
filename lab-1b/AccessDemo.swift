
import Foundation

class AccessDemo {

    private var studentID = "GLA2026"

    fileprivate var semester = 7

    internal var department = "Computer Science"

    public var institute = "GLA University"

    func showDetails() {
        print("Student ID: \(studentID)")
        print("Semester: \(semester)")
        print("Department: \(department)")
        print("Institute: \(institute)")
    }
}

func runAccessDemo() {

    let student = AccessDemo()

    print("===== ACCESS CONTROL DEMONSTRATION =====")

    student.showDetails()

    print("\nPublic Value:", student.institute)
    print("Internal Value:", student.department)
}
