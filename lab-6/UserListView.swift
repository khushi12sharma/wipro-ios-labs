import SwiftUI

struct UserListView: View {

    @StateObject private var viewModel = UserViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading users...")

                } else if let error = viewModel.errorMessage {
                    VStack(spacing: 12) {
                        Text(error)
                            .multilineTextAlignment(.center)

                        Button("Retry") {
                            Task {
                                await viewModel.loadUsers()
                            }
                        }
                    }
                    .padding()

                } else {
                    List(viewModel.users) { user in
                        NavigationLink {
                            UserDetailView(user: user)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .font(.headline)

                                Text(user.email)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("User Directory")
            .task {
                await viewModel.loadUsers()
            }
        }
    }
}
