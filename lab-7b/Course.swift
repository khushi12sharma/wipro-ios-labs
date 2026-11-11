
import Foundation

struct Course {

    let id: Int
    let name: String
    let duration: String
    let description: String

    static let sampleCourses = [
        Course(
            id: 1,
            name: "Swift Programming",
            duration: "4 Weeks",
            description: "Learn Swift basics, variables, functions and object-oriented programming."
        ),
        Course(
            id: 2,
            name: "UIKit Development",
            duration: "6 Weeks",
            description: "Learn UIViews, ViewControllers and Auto Layout."
        ),
        Course(
            id: 3,
            name: "iOS App Development",
            duration: "8 Weeks",
            description: "Learn navigation, app structure and iOS development."
        )
    ]
}
