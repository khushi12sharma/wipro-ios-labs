import SwiftUI

struct UserDetailView: View {

    let user: User

    var body: some View {
        Form {
            Section("Personal Information") {
                LabeledContent("Name", value: user.name)
                LabeledContent("Username", value: user.username)
                LabeledContent("Email", value: user.email)
            }

            Section("Contact Information") {
                LabeledContent("Phone", value: user.phone)
                LabeledContent("Website", value: user.website)
            }
        }
        .navigationTitle("User Details")
    }
}
