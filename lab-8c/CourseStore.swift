
import SwiftUI

class CourseStore: ObservableObject {
    @Published var courses: [Course] = Course.sampleCourses

    @Published var favouriteCourseIDs: Set<Int> = []

    func toggleFavourite(for course: Course) {
        if favouriteCourseIDs.contains(course.id) {
            favouriteCourseIDs.remove(course.id)
        } else {
            favouriteCourseIDs.insert(course.id)
        }
    }

    func isFavourite(_ course: Course) -> Bool {
        favouriteCourseIDs.contains(course.id)
    }

    var favouriteCourses: [Course] {
        courses.filter { favouriteCourseIDs.contains($0.id) }
    }
}
