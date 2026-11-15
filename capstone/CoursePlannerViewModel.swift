
import Foundation
import Combine

class CoursePlannerViewModel: ObservableObject {
    @Published var courses: [Course] = Course.sampleCourses
    @Published var searchText: String = ""

    var filteredCourses: [Course] {
        if searchText.isEmpty {
            return courses
        }

        return courses.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }

    var completedCount: Int {
        courses.filter { $0.isCompleted }.count
    }

    var favouriteCourses: [Course] {
        courses.filter { $0.isFavourite }
    }

    var progress: Double {
        guard !courses.isEmpty else { return 0 }
        return Double(completedCount) / Double(courses.count)
    }

    func toggleFavourite(for course: Course) {
        guard let index = courses.firstIndex(where: { $0.id == course.id }) else {
            return
        }

        courses[index].isFavourite.toggle()
    }

    func toggleCompleted(for course: Course) {
        guard let index = courses.firstIndex(where: { $0.id == course.id }) else {
            return
        }

        courses[index].isCompleted.toggle()
    }
}
