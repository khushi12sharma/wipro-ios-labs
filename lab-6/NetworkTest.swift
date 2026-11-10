import Foundation

func testUserModel() {
    let json = """
    {
        "id": 1,
        "name": "Khushi",
        "username": "khushi",
        "email": "khushi@example.com",
        "phone": "1234567890",
        "website": "example.com"
    }
    """

    let data = Data(json.utf8)

    do {
        let user = try JSONDecoder().decode(User.self, from: data)

        assert(user.name == "Khushi")
        assert(user.id == 1)

        print("Test 1 Passed: User JSON decoded successfully")

    } catch {
        print("Test 1 Failed:", error)
    }
}
