import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case httpError(Int)
    case decodingFailed
    case emptyResults
    case networkFailed
}
