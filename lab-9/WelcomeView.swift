
import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "iphone")
                    .font(.system(size: 55))
                    .foregroundColor(.blue)

                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Welcome to our iOS application.")
                    .font(.body)
                    .multilineTextAlignment(.center)

                Text("Explore the application and learn about its features.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)

                Button("Get Started") {
                    print("Get Started button tapped")
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}
