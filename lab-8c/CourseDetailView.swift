
import SwiftUI

struct CourseDetailView: View {
    let course: Course

    @ObservedObject var store: CourseStore

    private var favouriteBinding: Binding<Bool> {
        Binding(
            get: {
                store.isFavourite(course)
            },
            set: { newValue in
                if newValue != store.isFavourite(course) {
                    store.toggleFavourite(for: course)
                }
            }
        )
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image(systemName: "book.fill")
                .font(.system(size: 60))
                .foregroundColor(.blue)

            Text(course.title)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(course.category)
                .font(.headline)
                .foregroundColor(.blue)

            Text(course.description)
                .font(.body)

            Toggle(isOn: favouriteBinding) {
                Label("Favourite Course", systemImage: "heart.fill")
            }
            .tint(.red)

            Spacer()
        }
        .padding()
        .navigationTitle("Course Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
