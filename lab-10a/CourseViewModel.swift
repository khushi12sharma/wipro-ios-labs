
import Foundation

public final class CourseViewModel {

    public private(set) var favouriteCourseIDs: Set<Int> = []

    public init() {}

    public func toggleFavourite(courseID: Int) {
        if favouriteCourseIDs.contains(courseID) {
            favouriteCourseIDs.remove(courseID)
        } else {
            favouriteCourseIDs.insert(courseID)
        }
    }

    public func isFavourite(courseID: Int) -> Bool {
        return favouriteCourseIDs.contains(courseID)
    }
}
