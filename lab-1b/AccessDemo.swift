
import Foundation

public class AccessDemo {

    // Private: accessible only inside this class
    private var studentID = "GLA2026"

    // Fileprivate: accessible only within this file
    fileprivate var semester = 7

    // Internal: accessible within the same module
    internal var department = "Computer Science"

    // Public: accessible from other modules
    public var institute = "GLA University"

    func showDetails() {
        print("Student ID:", studentID)
        print("Semester:", semester)
        print("Department:", department)
        print("Institute:", institute)
    }
}

func runAccessDemo() {

    let student = AccessDemo()

    print("\n===== ACCESS CONTROL DEMONSTRATION =====")

    student.showDetails()

    print("\nPublic Value:", student.institute)
    print("Internal Value:", student.department)
}
