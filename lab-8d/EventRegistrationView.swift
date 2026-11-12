
import SwiftUI

struct EventRegistrationView: View {
    @State private var fullName = ""
    @State private var email = ""
    @State private var selectedEvent = "iOS Development Workshop"
    @State private var wantsUpdates = false
    @State private var acceptedTerms = false
    @State private var message = ""
    @State private var isSubmitted = false

    private let events = [
        "iOS Development Workshop",
        "SwiftUI Design Session",
        "Mobile App Development"
    ]

    private var isFormValid: Bool {
        !fullName.trimmingCharacters(in: .whitespaces).isEmpty &&
        email.contains("@") &&
        acceptedTerms
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Personal Information") {
                    TextField("Full Name", text: $fullName)
                        .textContentType(.name)

                    TextField("Email Address", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                }

                Section("Event Details") {
                    Picker("Select Event", selection: $selectedEvent) {
                        ForEach(events, id: \.self) { event in
                            Text(event)
                        }
                    }

                    Toggle("Receive event updates", isOn: $wantsUpdates)
                }

                Section("Confirmation") {
                    Toggle("I accept the terms and conditions", isOn: $acceptedTerms)

                    Button("Submit Registration") {
                        if isFormValid {
                            isSubmitted = true
                            message = "Registration submitted successfully!"
                        } else {
                            message = "Please enter valid details and accept the terms."
                        }
                    }
                    .disabled(!isFormValid)
                }

                if !message.isEmpty {
                    Section("Registration Status") {
                        Text(message)
                            .foregroundColor(isSubmitted ? .green : .red)
                    }
                }
            }
            .navigationTitle("Event Registration")
            .padding(.vertical, 8)
        }
    }
}
