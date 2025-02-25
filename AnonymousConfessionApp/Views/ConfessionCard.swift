import SwiftUI

struct ConfessionCard: View {
    let confession: Confession
    @State private var isReacting = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(confession.text)
                .font(.body)
                .lineLimit(3)
                .foregroundColor(.primary)

            HStack {
                Text(confession.timestamp, style: .time)
                    .font(.caption)
                    .foregroundColor(.gray)

                Spacer()

                // Emoji reactions
                ForEach(Array(confession.reactions.keys.sorted()), id: \.self) { emoji in
                    ReactionButton(emoji: emoji, count: confession.reactions[emoji] ?? 0)
                        .scaleEffect(isReacting ? 1.2 : 1) // Bounce effect
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.5)) {
                                isReacting.toggle()
                            }
                        }
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}