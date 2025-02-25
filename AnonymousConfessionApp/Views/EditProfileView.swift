//
//  EditProfileView.swift
//  AnonymousConfessionApp
//
//  Created by ABHINAV ANAND  on 22/02/25.
//


import SwiftUI

struct EditProfileView: View {
    @State private var username = "JohnDoe"
    @State private var bio = "Cute little bio goes here."
    @State private var profilePicture: UIImage? = UIImage(named: "profile_picture")

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile Picture").font(.custom("Avenir", size: 18))) {
                    Button(action: {
                        // Add logic to change profile picture
                    }) {
                        if let profilePicture = profilePicture {
                            Image(uiImage: profilePicture)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                        } else {
                            Text("Add Profile Picture")
                                .font(.custom("Avenir", size: 16))
                        }
                    }
                }

                Section(header: Text("Username").font(.custom("Avenir", size: 18))) {
                    TextField("Username", text: $username)
                        .font(.custom("Avenir", size: 16))
                }

                Section(header: Text("Bio").font(.custom("Avenir", size: 18))) {
                    TextField("Bio", text: $bio)
                        .font(.custom("Avenir", size: 16))
                }
            }
            .navigationTitle("Edit Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // Add logic to save changes
                    }
                }
            }
        }
    }
}

// Preview Provider
struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}