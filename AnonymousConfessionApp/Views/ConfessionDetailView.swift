import SwiftUI

struct ConfessionDetailView: View {
    @Binding var confession: Confession
    @State private var selectedEmoji: String?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(confession.text)
                    .font(.title2)
                    .foregroundColor(.primary)

                Text("Posted at \(confession.timestamp, style: .time)")
                    .font(.caption)
                    .foregroundColor(.gray)

                Divider()

                Text("Reactions")
                    .font(.headline)

                HStack(spacing: 16) {
                    ForEach(["😄", "😢", "😡", "❤️"], id: \.self) { emoji in
                        Button(action: {
                            selectedEmoji = emoji
                            confession.reactions[emoji] = (confession.reactions[emoji] ?? 0) + 1
                        }) {
                            Text(emoji)
                                .font(.system(size: 30))
                                .scaleEffect(selectedEmoji == emoji ? 1.2 : 1)
                                .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.5), value: selectedEmoji)
                        }
                    }
                }

                Divider()

                Text("Reaction Counts")
                    .font(.headline)

                ForEach(Array(confession.reactions.keys.sorted()), id: \.self) { emoji in
                    HStack {
                        Text(emoji)
                        Text("\(confession.reactions[emoji] ?? 0)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Confession Details")
    }
}