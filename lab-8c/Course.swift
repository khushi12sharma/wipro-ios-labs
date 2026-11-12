
import Foundation

struct Course: Identifiable, Hashable {
    let id: Int
    let title: String
    let category: String
    let description: String

    static let sampleCourses = [
        Course(
            id: 1,
            title: "Swift Programming",
            category: "Programming",
            description: "Learn Swift fundamentals and build iOS applications."
        ),
        Course(
            id: 2,
            title: "Web Development",
            category: "Development",
            description: "Learn HTML, CSS and JavaScript for web development."
        ),
        Course(
            id: 3,
            title: "Data Science",
            category: "Technology",
            description: "Explore data analysis and basic machine learning."
        ),
        Course(
            id: 4,
            title: "UI/UX Design",
            category: "Design",
            description: "Learn user interface and user experience design."
        )
    ]
}
