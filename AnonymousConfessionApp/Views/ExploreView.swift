import SwiftUI

struct ExploreView: View {
    @State private var posts: [String] = [
        "post1", "post2", "post3", "post4", "post5"
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(posts, id: \.self) { post in
                        Image(post)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationTitle("Explore")
        }
    }
}

// Preview Provider
struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}