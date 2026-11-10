import Foundation

struct User {
    let name: String
}

struct Course {
    let name: String
}

func fetchUser() async -> User {
    try? await Task.sleep(nanoseconds: 1_000_000_000)
    return User(name: "Khushi")
}

func fetchCourses() async -> [Course] {
    try? await Task.sleep(nanoseconds: 1_500_000_000)
    return [
        Course(name: "Swift"),
        Course(name: "Concurrency")
    ]
}

func loadDashboard() async {
    async let user = fetchUser()
    async let courses = fetchCourses()

    let (userResult, courseResults) = await (user, courses)

    print("===== DASHBOARD =====")
    print("User:", userResult.name)

    print("Courses:")
    for course in courseResults {
        print("-", course.name)
    }

    print("Both data sources fetched successfully")
}
