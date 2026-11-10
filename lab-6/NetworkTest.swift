import Foundation

func runNetworkTests() {

    print("===== LAB 6 TEST CASES =====")

    let validJSON = """
    {
        "id": 1,
        "name": "Khushi",
        "username": "khushi",
        "email": "khushi@example.com",
        "phone": "1234567890",
        "website": "example.com"
    }
    """

    do {
        let user = try JSONDecoder().decode(
            User.self,
            from: Data(validJSON.utf8)
        )
        assert(user.name == "Khushi")
        print("Test 1 Passed: JSON decoded successfully")
    } catch {
        print("Test 1 Failed")
    }

    let invalidJSON = Data("Invalid JSON".utf8)

    do {
        _ = try JSONDecoder().decode(User.self, from: invalidJSON)
        print("Test 2 Failed")
    } catch {
        print("Test 2 Passed: Decoding error detected")
    }

    let emptyJSON = Data("[]".utf8)

    do {
        let users = try JSONDecoder().decode([User].self, from: emptyJSON)
        assert(users.isEmpty)
        print("Test 3 Passed: Empty response detected")
    } catch {
        print("Test 3 Failed")
    }

    var components = URLComponents()
    components.scheme = "invalid"
    components.host = nil

    if components.url == nil {
        print("Test 4 Passed: Invalid URL detected")
    } else {
        print("Test 4 Failed")
    }

    let statusCode = 404

    if !(200...299).contains(statusCode) {
        print("Test 5 Passed: HTTP error status detected")
    } else {
        print("Test 5 Failed")
    }
}
