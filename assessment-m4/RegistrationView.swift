
import SwiftUI

struct RegistrationView: View {
    @State private var studentName = ""
    @State private var email = ""
    @State private var selectedCourse = "Swift Programming"

    @State private var isLoading = false
    @State private var isSuccess = false
    @State private var errorMessage = ""

    private let courses = [
        "Swift Programming",
        "SwiftUI Development",
        "iOS App Development"
    ]

    var body: some View {
        NavigationStack {
            Form {
                Section("Student Information") {
                    TextField("Enter your name", text: $studentName)
                        .accessibilityIdentifier("registration.nameField")

                    TextField("Enter your email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .accessibilityIdentifier("registration.emailField")
                }

                Section("Course Selection") {
                    Picker("Select Course", selection: $selectedCourse) {
                        ForEach(courses, id: \.self) { course in
                            Text(course)
                        }
                    }
                }

                Section {
                    Button {
                        submitRegistration()
                    } label: {
                        HStack {
                            Spacer()

                            if isLoading {
                                ProgressView()
                            } else {
                                Text("Register")
                            }

                            Spacer()
                        }
                    }
                    .disabled(isLoading)
                    .accessibilityIdentifier("registration.submitButton")
                }

                if !errorMessage.isEmpty {
                    Section("Error") {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .accessibilityIdentifier("registration.errorMessage")
                    }
                }

                if isSuccess {
                    Section("Registration Status") {
                        Label(
                            "Registration Successful!",
                            systemImage: "checkmark.circle.fill"
                        )
                        .foregroundColor(.green)
                        .accessibilityIdentifier("registration.successMessage")

                        Text("Name: \(studentName)")
                        Text("Course: \(selectedCourse)")
                    }
                }
            }
            .navigationTitle("Course Registration")
        }
    }

    private func submitRegistration() {
        errorMessage = ""
        isSuccess = false

        guard !studentName.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter your name."
            return
        }

        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email address."
            return
        }

        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
            isSuccess = true
        }
    }
}
