
import Foundation

struct UserResponse: Codable {
    let users: [User]
}

struct User: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let image: String

    var fullName: String {
        "\(firstName) \(lastName)"
    }

    enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case email
        case image
    }
}
