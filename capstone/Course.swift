
import Foundation

struct Course: Identifiable {
    let id: Int
    let name: String
    let description: String
    let duration: String
    var isFavourite: Bool
    var isCompleted: Bool

    static let sampleCourses = [
        Course(
            id: 1,
            name: "Swift Programming",
            description: "Learn Swift basics, functions and structures.",
            duration: "30 Days",
            isFavourite: false,
            isCompleted: false
        ),
        Course(
            id: 2,
            name: "SwiftUI Development",
            description: "Build interactive interfaces using SwiftUI.",
            duration: "45 Days",
            isFavourite: false,
            isCompleted: false
        ),
        Course(
            id: 3,
            name: "iOS App Development",
            description: "Learn navigation, state management and app development.",
            duration: "60 Days",
            isFavourite: false,
            isCompleted: false
        )
    ]
}
