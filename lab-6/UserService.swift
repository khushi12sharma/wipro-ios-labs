import Foundation

class UserService {

    func fetchUsers() async throws -> [User] {

        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = "/users"

        guard let url = components.url else {
            throw NetworkError.invalidURL
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.httpError(httpResponse.statusCode)
            }

            let users: [User]

            do {
                users = try JSONDecoder().decode([User].self, from: data)
            } catch {
                throw NetworkError.decodingFailed
            }

            guard !users.isEmpty else {
                throw NetworkError.emptyResults
            }

            return users

        } catch is CancellationError {
            throw CancellationError()

        } catch let error as NetworkError {
            throw error

        } catch {
            throw NetworkError.networkFailed
        }
    }
}
