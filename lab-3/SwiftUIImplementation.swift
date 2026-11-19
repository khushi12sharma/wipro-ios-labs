
import SwiftUI

struct SwiftUIImplementation: View {

    @State private var userName = ""
    @State private var result = "Your result will appear here"

    var body: some View {

        VStack(spacing: 20) {

            Text("Student Greeting App")
                .font(.largeTitle)
                .fontWeight(.bold)

            TextField("Enter your name", text: $userName)
                .textFieldStyle(.roundedBorder)
                .padding()

            Button(action: {
                if userName.isEmpty {
                    result = "Please enter your name"
                } else {
                    result = "Hello, \(userName)!"
                }
            }) {
                Text("Submit")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            Text(result)
                .font(.title3)
                .foregroundColor(.green)
        }
        .padding()
    }
}

#Preview {
    SwiftUIImplementation()
}
