
import SwiftUI

struct CourseListView: View {
    @StateObject private var viewModel = CoursePlannerViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("My Learning Progress")
                        .font(.headline)

                    ProgressView(value: viewModel.progress)

                    Text("\(viewModel.completedCount) of \(viewModel.courses.count) courses completed")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()

                TextField("Search courses", text: $viewModel.searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                if viewModel.filteredCourses.isEmpty {
                    ContentUnavailableView(
                        "No Courses Found",
                        systemImage: "book",
                        description: Text("Try another search term.")
                    )
                } else {
                    List(viewModel.filteredCourses) { course in
                        NavigationLink {
                            CourseDetailView(
                                course: course,
                                viewModel: viewModel
                            )
                        } label: {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(course.name)
                                    .font(.headline)

                                Text(course.duration)
                                    .font(.caption)
                                    .foregroundColor(.secondary)

                                HStack {
                                    if course.isFavourite {
                                        Label("Favourite", systemImage: "heart.fill")
                                    }

                                    if course.isCompleted {
                                        Label("Completed", systemImage: "checkmark.circle.fill")
                                    }
                                }
                                .font(.caption)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Course Planner")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Register") {
                        RegistrationView()
                    }
                }
            }
        }
    }
}
