
import SwiftUI

struct CourseListView: View {
    @StateObject private var store = CourseStore()
    @State private var searchText = ""

    private var filteredCourses: [Course] {
        if searchText.isEmpty {
            return store.courses
        }

        return store.courses.filter {
            $0.title.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            List {
                Section("All Courses") {
                    ForEach(filteredCourses) { course in
                        CourseRowView(
                            course: course,
                            isFavourite: Binding(
                                get: {
                                    store.isFavourite(course)
                                },
                                set: { newValue in
                                    if newValue != store.isFavourite(course) {
                                        store.toggleFavourite(for: course)
                                    }
                                }
                            )
                        )
                    }
                }

                Section("My Favourites") {
                    if store.favouriteCourses.isEmpty {
                        Text("No favourite courses yet.")
                            .foregroundColor(.secondary)
                    } else {
                        ForEach(store.favouriteCourses) { course in
                            NavigationLink(value: course) {
                                Label(
                                    course.title,
                                    systemImage: "heart.fill"
                                )
                                .foregroundColor(.red)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Courses")
            .searchable(text: $searchText)
            .navigationDestination(for: Course.self) { course in
                CourseDetailView(course: course, store: store)
            }
        }
    }
}
