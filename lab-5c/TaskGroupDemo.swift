
import Foundation

struct CourseResult {
    let courseID: Int
    let courseName: String
}

enum CourseError: Error {
    case requestFailed(Int)
}

// Simulates fetching details for one course
func fetchCourse(id: Int) async throws -> CourseResult {

    try await Task.sleep(nanoseconds: UInt64(id) * 500_000_000)

    try Task.checkCancellation()

    // Course 3 simulates a failure
    if id == 3 {
        throw CourseError.requestFailed(id)
    }

    return CourseResult(
        courseID: id,
        courseName: "Course \(id)"
    )
}

// Sequential implementation
func fetchSequentially() async -> [CourseResult] {

    var results: [CourseResult] = []

    for id in 1...5 {
        do {
            let course = try await fetchCourse(id: id)
            results.append(course)
        } catch {
            print("Sequential: Course \(id) failed")
        }
    }

    return results
}

// Concurrent implementation using Task Group
func fetchConcurrently() async -> [CourseResult] {

    return await withTaskGroup(of: CourseResult?.self) { group in

        for id in 1...5 {
            group.addTask {
                do {
                    return try await fetchCourse(id: id)
                } catch {
                    print("Concurrent: Course \(id) failed")
                    return nil
                }
            }
        }

        var results: [CourseResult] = []

        for await result in group {
            if let course = result {
                results.append(course)
            }
        }

        return results.sorted { $0.courseID < $1.courseID }
    }
}

// Measure execution time
func measureTime(
    operation: () async -> [CourseResult]
) async -> Double {

    let start = Date()
    let results = await operation()
    let elapsed = Date().timeIntervalSince(start)

    print("Successful courses:", results.count)

    return elapsed
}

// Main execution
@main
struct TaskGroupDemo {

    static func main() async {

        print("===== SEQUENTIAL EXECUTION =====")

        let sequentialTime = await measureTime {
            await fetchSequentially()
        }

        print("Sequential Time:", sequentialTime, "seconds")

        print("\n===== CONCURRENT EXECUTION =====")

        let concurrentTime = await measureTime {
            await fetchConcurrently()
        }

        print("Concurrent Time:", concurrentTime, "seconds")

        print("\n===== COMPARISON =====")
        print("Sequential:", sequentialTime, "seconds")
        print("Concurrent:", concurrentTime, "seconds")
    }
}
