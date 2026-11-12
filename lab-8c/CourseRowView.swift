
import SwiftUI

struct CourseRowView: View {
    let course: Course
    @Binding var isFavourite: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(course.title)
                    .font(.headline)

                Text(course.category)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Button {
                isFavourite.toggle()
            } label: {
                Image(systemName: isFavourite ? "heart.fill" : "heart")
                    .foregroundColor(isFavourite ? .red : .gray)
                    .font(.title2)
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 6)
    }
}
