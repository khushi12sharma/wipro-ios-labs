
import SwiftUI

struct CourseDetailView: View {
    let course: Course

    @Binding var isFavourite: Bool

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "book.fill")
                .font(.system(size: 60))
                .foregroundColor(.blue)

            Text(course.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            Text(course.description)
                .font(.body)
                .multilineTextAlignment(.center)

            Text("Duration: \(course.duration)")
                .font(.headline)

            Button {
                isFavourite.toggle()
            } label: {
                Label(
                    isFavourite ? "Remove Favourite" : "Add to Favourites",
                    systemImage: isFavourite ? "star.fill" : "star"
                )
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
        .navigationTitle("Course Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
