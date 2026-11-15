
import SwiftUI

struct CourseDetailView: View {
    let course: Course
    @ObservedObject var viewModel: CoursePlannerViewModel

    private var currentCourse: Course {
        viewModel.courses.first(where: { $0.id == course.id }) ?? course
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(currentCourse.name)
                .font(.largeTitle)
                .bold()

            Text(currentCourse.description)
                .font(.body)

            Label(currentCourse.duration, systemImage: "calendar")

            Divider()

            Button {
                viewModel.toggleFavourite(for: currentCourse)
            } label: {
                Label(
                    currentCourse.isFavourite ? "Remove Favourite" : "Add to Favourite",
                    systemImage: "heart"
                )
            }
            .buttonStyle(.borderedProminent)

            Button {
                viewModel.toggleCompleted(for: currentCourse)
            } label: {
                Label(
                    currentCourse.isCompleted ? "Mark as Incomplete" : "Mark as Completed",
                    systemImage: "checkmark.circle"
                )
            }
            .buttonStyle(.bordered)

            Spacer()
        }
        .padding()
        .navigationTitle("Course Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
