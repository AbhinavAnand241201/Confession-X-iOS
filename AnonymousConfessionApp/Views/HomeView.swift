import SwiftUI

struct HomeView: View {
    @State private var showConfessionSheet = false
    @State private var confessions: [Confession] = [
        Confession(text: "I ate the last slice of pizza and blamed it on the dog.", timestamp: Date(), reactions: ["😄": 3, "😢": 1]),
        Confession(text: "I secretly love pineapple on pizza.", timestamp: Date(), reactions: ["😄": 5, "😡": 2]),
        Confession(text: "I pretend to work hard, but I’m just scrolling memes.", timestamp: Date(), reactions: ["😄": 10, "😢": 2])
    ]
    @State private var showSettings = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(confessions) { confession in
                        NavigationLink(destination: ConfessionDetailView(confession: binding(for: confession))) {
                            ConfessionCard(confession: confession)
                                .transition(.asymmetric(insertion: .move(edge: .top), removal: .opacity))
                        }
                        .buttonStyle(PlainButtonStyle()) // Remove default button styling
                    }
                }
                .padding()
            }
            .navigationTitle("Confessions")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showSettings.toggle()
                    }) {
                        Image(systemName: "gearshape")
                            .font(.title2)
                            .padding(8)
                            .background(Color.blue.opacity(0.2))
                            .clipShape(Circle())
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation(.spring()) {
                            showConfessionSheet.toggle()
                        }
                    }) {
                        Image(systemName: "plus")
                            .font(.title2)
                            .padding(8)
                            .background(Color.blue.opacity(0.2))
                            .clipShape(Circle())
                    }
                }
            }
            .sheet(isPresented: $showConfessionSheet) {
                PostConfessionView(confessions: $confessions)
            }
            .sheet(isPresented: $showSettings) {
                SettingsView(confessions: $confessions)
            }
        }
    }

    // Helper function to get a binding for a specific confession
    private func binding(for confession: Confession) -> Binding<Confession> {
        guard let index = confessions.firstIndex(where: { $0.id == confession.id }) else {
            fatalError("Confession not found")
        }
        return $confessions[index]
    }
}

// Preview Provider
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}