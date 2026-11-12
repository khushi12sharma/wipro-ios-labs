
import Foundation

struct Course: Identifiable {
    let id: Int
    let title: String
    let category: String
    let description: String
    let duration: String
    let instructor: String

    static let sampleCourses = [
        Course(
            id: 1,
            title: "Swift Programming",
            category: "Mobile Development",
            description: "Learn Swift programming fundamentals and build applications.",
            duration: "6 Weeks",
            instructor: "John Smith"
        ),
        Course(
            id: 2,
            title: "Web Development",
            category: "Development",
            description: "Learn HTML, CSS and JavaScript to create websites.",
            duration: "8 Weeks",
            instructor: "Sarah Lee"
        ),
        Course(
            id: 3,
            title: "Data Science",
            category: "Technology",
            description: "Explore data analysis and basic machine learning concepts.",
            duration: "10 Weeks",
            instructor: "David Brown"
        ),
        Course(
            id: 4,
            title: "UI/UX Design",
            category: "Design",
            description: "Understand user interface and user experience design.",
            duration: "5 Weeks",
            instructor: "Emily Davis"
        )
    ]
}
