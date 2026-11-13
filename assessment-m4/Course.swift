
import Foundation

struct Course: Identifiable {
    let id: Int
    let name: String
    let description: String
    let duration: String

    static let sampleCourses = [
        Course(
            id: 1,
            name: "Swift Programming",
            description: "Learn Swift basics, functions, structures and object-oriented programming.",
            duration: "30 Days"
        ),
        Course(
            id: 2,
            name: "SwiftUI Development",
            description: "Learn to create user interfaces using SwiftUI views and layouts.",
            duration: "45 Days"
        ),
        Course(
            id: 3,
            name: "iOS App Development",
            description: "Understand navigation, state management and app development.",
            duration: "60 Days"
        )
    ]
}
