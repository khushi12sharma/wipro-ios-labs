
import SwiftUI

struct CourseDetailView: View {
    let course: Course
    @ObservedObject var viewModel: CoursePlannerViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(course.name)
                .font(.largeTitle)
                .bold()

            Text(course.description)
                .font(.body)

            Label(course.duration, systemImage: "calendar")
                .foregroundColor(.secondary)

            Divider()

            Button {
                viewModel.toggleFavourite(for: course)
            } label: {
                Label(
                    course.isFavourite ? "Remove Favourite" : "Add to Favourite",
                    systemImage: "heart"
                )
            }
            .buttonStyle(.borderedProminent)

            Button {
                viewModel.toggleCompleted(for: course)
            } label: {
                Label(
                    course.isCompleted ? "Mark as Incomplete" : "Mark as Completed",
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
