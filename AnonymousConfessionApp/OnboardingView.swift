import SwiftUI

struct OnboardingView: View {
    @AppStorage("isOnboardingCompleted") private var isOnboardingCompleted = false
    @State private var currentPage = 0

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                OnboardingPage(
                    imageName: "confession",
                    title: "Share Your Thoughts",
                    description: "Post anonymous confessions and express yourself freely."
                )
                .tag(0)

                OnboardingPage(
                    imageName: "emoji",
                    title: "React with Emojis",
                    description: "Express your feelings with fun emoji reactions."
                )
                .tag(1)

                OnboardingPage(
                    imageName: "privacy",
                    title: "Stay Anonymous",
                    description: "Your identity is safe with us. No accounts, no tracking."
                )
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))

            HStack {
                if currentPage > 0 {
                    Button("Back") {
                        withAnimation {
                            currentPage -= 1
                        }
                    }
                    .padding()
                }

                Spacer()

                if currentPage < 2 {
                    Button("Next") {
                        withAnimation {
                            currentPage += 1
                        }
                    }
                    .padding()
                } else {
                    Button("Get Started") {
                        isOnboardingCompleted = true
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct OnboardingPage: View {
    let imageName: String
    let title: String
    let description: String

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)

            Text(title)
                .font(.title)
                .fontWeight(.bold)

            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
    }
}

// Preview Provider
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}