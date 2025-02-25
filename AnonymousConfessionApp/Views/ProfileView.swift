//
//  ProfileView.swift
//  AnonymousConfessionApp
//
//  Created by ABHINAV ANAND  on 22/02/25.
//


import SwiftUI

struct ProfileView: View {
    @State private var user: User = User(username: "JohnDoe", bio: "Cute little bio goes here.", profilePicture: "profile_picture")
    @State private var confessions: [Confession] = [
        Confession(text: "I ate the last slice of pizza and blamed it on the dog.", timestamp: Date(), reactions: ["😄": 3, "😢": 1]),
        Confession(text: "I secretly love pineapple on pizza.", timestamp: Date(), reactions: ["😄": 5, "😡": 2]),
        Confession(text: "I pretend to work hard, but I’m just scrolling memes.", timestamp: Date(), reactions: ["😄": 10, "😢": 2])
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Profile Picture
                Image(user.profilePicture)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())

                // Username
                Text(user.username)
                    .font(.custom("Avenir", size: 24))
                    .fontWeight(.bold)

                // Bio
                Text(user.bio)
                    .font(.custom("Avenir", size: 16))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // Latest Confessions
                Text("Latest Confessions")
                    .font(.custom("Avenir", size: 20))
                    .fontWeight(.bold)
                    .padding(.top, 16)

                ForEach(confessions) { confession in
                    ConfessionCard(confession: confession)
                }
            }
            .padding()
        }
        .navigationTitle("Profile")
    }
}

// User Model
struct User {
    let username: String
    let bio: String
    let profilePicture: String
}

// Preview Provider
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}