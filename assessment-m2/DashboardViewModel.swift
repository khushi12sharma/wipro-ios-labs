import Foundation

enum DashboardState {
    case loading
    case success
    case error
    case cancelled
}

enum DashboardError: Error {
    case dataFailed
}

actor DashboardViewModel {

    private var state: DashboardState = .loading

    func loadData(shouldFail: Bool = false) async {

        state = .loading
        print("Loading...")

        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            try Task.checkCancellation()

            if shouldFail {
                throw DashboardError.dataFailed
            }

            state = .success
            print("Success: Data loaded successfully")

        } catch is CancellationError {
            state = .cancelled
            print("Cancelled: Request was cancelled")

        } catch {
            state = .error
            print("Error: Failed to load data")
        }
    }
}
