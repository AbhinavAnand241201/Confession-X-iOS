import SwiftUI

struct ReactionButton: View {
    let emoji: String
    let count: Int

    var body: some View {
        HStack(spacing: 4) {
            Text(emoji)
            Text("\(count)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(8)
        .background(Color(.systemGray5))
        .cornerRadius(20)
    }
}