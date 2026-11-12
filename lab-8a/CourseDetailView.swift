
import SwiftUI

struct CourseDetailView: View {
    let course: Course

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.blue.opacity(0.15))
                        .frame(height: 160)

                    Image(systemName: "book.closed.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.blue)
                }

                Text(course.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(course.category)
                    .font(.headline)
                    .foregroundColor(.blue)

                Text(course.description)
                    .font(.body)

                Divider()

                Label("Duration: \(course.duration)", systemImage: "clock")

                Label("Instructor: \(course.instructor)", systemImage: "person.fill")
            }
            .padding()
        }
        .navigationTitle("Course Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
