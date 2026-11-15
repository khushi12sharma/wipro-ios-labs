
import SwiftUI

struct RegistrationView: View {
    @State private var studentName = ""
    @State private var email = ""
    @State private var selectedCourse = "Swift Programming"
    @State private var message = ""
    @State private var isSuccess = false

    let availableCourses = [
        "Swift Programming",
        "SwiftUI Development",
        "iOS App Development"
    ]

    var body: some View {
        Form {
            Section("Student Information") {
                TextField("Enter your name", text: $studentName)

                TextField("Enter your email", text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }

            Section("Select Course") {
                Picker("Course", selection: $selectedCourse) {
                    ForEach(availableCourses, id: \.self) { course in
                        Text(course)
                    }
                }
            }

            Section {
                Button("Register Now") {
                    registerStudent()
                }
            }

            if !message.isEmpty {
                Section("Registration Status") {
                    Text(message)
                        .foregroundColor(isSuccess ? .green : .red)
                }
            }
        }
        .navigationTitle("Registration")
    }

    func registerStudent() {
        let trimmedName = studentName.trimmingCharacters(in: .whitespaces)

        let trimmedEmail = email.trimmingCharacters(in: .whitespaces)

        guard !trimmedName.isEmpty else {
            message = "Please enter your name."
            isSuccess = false
            return
        }

        guard trimmedEmail.contains("@"),
              trimmedEmail.contains(".") else {
            message = "Please enter a valid email."
            isSuccess = false
            return
        }

        message = "Registration successful for \(selectedCourse)!"
        isSuccess = true
    }
}
