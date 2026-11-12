
import SwiftUI

struct CourseExplorerView: View {
    @State private var selectedCategory = "All"

    private let courses = Course.sampleCourses

    private var categories: [String] {
        ["All"] + Array(Set(courses.map { $0.category })).sorted()
    }

    private var filteredCourses: [Course] {
        if selectedCategory == "All" {
            return courses
        }

        return courses.filter {
            $0.category == selectedCategory
        }
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {

                Text("Explore Courses")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                Text("Learn something new today!")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(categories, id: \.self) { category in
                            Button {
                                selectedCategory = category
                            } label: {
                                Text(category)
                                    .font(.subheadline)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 9)
                                    .background(
                                        selectedCategory == category
                                        ? Color.blue
                                        : Color.gray.opacity(0.15)
                                    )
                                    .foregroundColor(
                                        selectedCategory == category
                                        ? .white
                                        : .primary
                                    )
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                ZStack {
                    Color(.systemGroupedBackground)

                    if filteredCourses.isEmpty {
                        EmptyStateView()
                    } else {
                        List(filteredCourses) { course in
                            NavigationLink {
                                CourseDetailView(course: course)
                            } label: {
                                CourseCardView(course: course)
                            }
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                            .listRowInsets(
                                EdgeInsets(
                                    top: 8,
                                    leading: 16,
                                    bottom: 8,
                                    trailing: 16
                                )
                            )
                        }
                        .listStyle(.plain)
                    }
                }
            }
            .navigationTitle("Course Explorer")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CourseExplorerView()
}
