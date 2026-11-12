
import SwiftUI

struct ProductListView: View {
    private let products = Product.sampleProducts

    @State private var navigationPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            List(products) { product in
                NavigationLink(value: product) {
                    HStack(spacing: 15) {
                        Image(systemName: "shippingbox.fill")
                            .font(.title2)
                            .foregroundColor(.blue)

                        VStack(alignment: .leading, spacing: 5) {
                            Text(product.name)
                                .font(.headline)

                            Text(product.category)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        Text(product.price)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .padding(.vertical, 6)
                }
            }
            .navigationTitle("Products")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Featured") {
                        if let featuredProduct = products.first {
                            navigationPath.append(featuredProduct)
                        }
                    }
                }
            }
            .navigationDestination(for: Product.self) { product in
                ProductDetailView(product: product)
            }
        }
    }
}
