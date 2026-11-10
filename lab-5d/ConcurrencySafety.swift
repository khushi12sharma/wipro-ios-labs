import Foundation

class UnsafeCounter {
    var count = 0

    func increment() {
        count += 1
    }
}

actor SafeCounter {
    private var count = 0

    func increment() {
        count += 1
    }

    func getCount() -> Int {
        return count
    }
}

let unsafeCounter = UnsafeCounter()

DispatchQueue.concurrentPerform(iterations: 1000) { _ in
    unsafeCounter.increment()
}

print("===== BEFORE: UNSAFE COUNTER =====")
print("Unsafe counter result:", unsafeCounter.count)

let semaphore = DispatchSemaphore(value: 0)

Task {
    let safeCounter = SafeCounter()

    await withTaskGroup(of: Void.self) { group in
        for _ in 1...1000 {
            group.addTask {
                await safeCounter.increment()
            }
        }
    }

    let result = await safeCounter.getCount()

    print("\n===== AFTER: SAFE ACTOR COUNTER =====")
    print("Safe counter result:", result)
    print("Expected result: 1000")

    semaphore.signal()
}

semaphore.wait()
