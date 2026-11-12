
import SwiftUI

struct ProductDetailView: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image(systemName: "shippingbox.fill")
                .font(.system(size: 65))
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity)
                .padding()

            Text(product.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(product.category)
                .font(.headline)
                .foregroundColor(.blue)

            Text(product.description)
                .font(.body)

            HStack {
                Text("Price")
                    .fontWeight(.semibold)

                Spacer()

                Text(product.price)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
