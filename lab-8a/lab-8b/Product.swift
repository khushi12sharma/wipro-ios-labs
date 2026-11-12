
import Foundation

struct Product: Identifiable, Hashable {
    let id: Int
    let name: String
    let category: String
    let price: String
    let description: String

    static let sampleProducts = [
        Product(
            id: 1,
            name: "Laptop",
            category: "Electronics",
            price: "₹55,000",
            description: "A laptop suitable for programming and everyday work."
        ),
        Product(
            id: 2,
            name: "Headphones",
            category: "Accessories",
            price: "₹2,500",
            description: "Comfortable headphones for music and online meetings."
        ),
        Product(
            id: 3,
            name: "Smartphone",
            category: "Electronics",
            price: "₹18,000",
            description: "A smartphone with useful everyday features."
        ),
        Product(
            id: 4,
            name: "Backpack",
            category: "Accessories",
            price: "₹1,200",
            description: "A lightweight backpack for carrying daily essentials."
        )
    ]
}
