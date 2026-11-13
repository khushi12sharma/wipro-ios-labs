
import SwiftUI

struct CourseExplorerView: View {
    @State private var favouriteCourseIDs: Set<Int> = []

    private var courses: [Course] {
        Course.sampleCourses
    }

    private func favouriteBinding(for course: Course) -> Binding<Bool> {
        Binding(
            get: {
                favouriteCourseIDs.contains(course.id)
            },
            set: { isFavourite in
                if isFavourite {
                    favouriteCourseIDs.insert(course.id)
                } else {
                    favouriteCourseIDs.remove(course.id)
                }
            }
        )
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Available Courses") {
                    ForEach(courses) { course in
                        NavigationLink {
                            CourseDetailView(
                                course: course,
                                isFavourite: favouriteBinding(for: course)
                            )
                        } label: {
                            HStack {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(course.name)
                                        .font(.headline)

                                    Text(course.duration)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }

                                Spacer()

                                if favouriteCourseIDs.contains(course.id) {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                            }
                            .padding(.vertical, 5)
                        }
                    }
                }
            }
            .navigationTitle("Course Explorer")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        RegistrationView()
                    } label: {
                        Image(systemName: "person.badge.plus")
                    }
                    .accessibilityIdentifier("course.registrationButton")
                    .accessibilityLabel("Open Registration")
                }
            }
        }
    }
}
