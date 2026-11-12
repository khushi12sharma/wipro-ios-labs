
import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case noData
}

final class APIService {

    func fetchUsers() async throws -> [User] {

        guard let url = URL(
            string: "https://dummyjson.com/users"
        ) else {
            throw APIError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(
            from: url
        )

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }

        guard !data.isEmpty else {
            throw APIError.noData
        }

        let decodedResponse = try JSONDecoder().decode(
            UserResponse.self,
            from: data
        )

        return decodedResponse.users
    }
}
