Confession-X-iOS
Anonymously share your thoughts, confessions, and stories with the world or your private circle.
Confession-X is a modern, feature-rich iOS app built with Swift, SwiftUI, and MVVM architecture. It empowers users to share confessions through text, images, audio, and polls while maintaining control over their anonymity. With a sleek UI, smooth animations, and a focus on memory-efficient code, Confession-X delivers a seamless and engaging user experience.
✨ Features
Core Functionality

Anonymous Confessions: Post confessions anonymously (fully anonymous, pseudonym-based, or profile-linked) with customizable avatars or emojis.
Multimedia Support: Share confessions via text, images, or short audio recordings (15-30 seconds).
Polls: Attach polls to confessions (e.g., Yes/No or multiple-choice) with real-time voting and result display.
Daily/Weekly Prompts: Engage with creative confession prompts like “Share a secret about your favorite hobby” or “Confess a funny mistake.”
Private Groups: Create or join private groups (e.g., “Close Friends” or “College Mates”) for exclusive confession sharing.

Social Features

Feed View: Browse a dynamic feed of confessions with like, comment, and share options.
Follow/Unfollow: Connect with other users and curate your feed.
Discussions: Comment and discuss confessions in threaded conversations.
Notifications: Stay updated with real-time notifications for likes, comments, follows, and group activity.

User Experience

Modern UI: Clean, unique, and visually appealing SwiftUI-based interface.
Smooth Animations: Subtle, polished animations for transitions, likes, and interactions.
User Profiles: Customize profiles with avatars, bios, and settings for anonymity and notifications.
Memory Efficiency: Optimized codebase using MVVM architecture for performance and scalability.

Security & Authentication

Firebase Authentication: Secure login with email, Google, or Apple Sign-In.
Anonymity Controls: Fine-grained options to control how your identity is shared.
Data Privacy: Encrypted storage and transmission of sensitive user data.

🛠️ Tech Stack

Language: Swift 5.7+
Framework: SwiftUI
Architecture: MVVM (Model-View-ViewModel)
Backend: Firebase (Authentication, Firestore, Storage)
Tools: Xcode 15.0+, Git
Dependencies: Managed via Swift Package Manager (e.g., Firebase SDK)

📱 Screenshots
(Coming soon! Screenshots will be added to showcase the UI and features.)



Feed View
Confession Creation
User Profile








🚀 Getting Started
Prerequisites

Xcode: Version 15.0 or later
macOS: Ventura 13.0 or later
Apple Developer Account: Required for testing on physical devices
Firebase Account: For authentication, storage, and database

Installation

Clone the repository:
git clone https://github.com/AbhinavAnand241201/Confession-X-iOS.git
cd Confession-X-iOS


Install dependencies:

Open AnonymousConfessionApp.xcodeproj in Xcode.
Xcode will automatically resolve Swift Package Manager dependencies (e.g., Firebase).


Configure Firebase:

Create a Firebase project at console.firebase.google.com.
Download the GoogleService-Info.plist file and add it to the AnonymousConfessionApp target in Xcode.
Enable Authentication (Email, Google, Apple), Firestore, and Storage in Firebase.


Build and run:

Select your target device or simulator in Xcode.
Press Cmd + R to build and run the app.



🛠️ Project Structure
Confession-X-iOS/
├── AnonymousConfessionApp/
│   ├── Models/              # Data models
│   ├── Views/               # SwiftUI views
│   ├── ViewModels/          # MVVM view models
│   ├── Services/            # Networking, Firebase, and utility services
│   ├── Assets.xcassets/     # Images and app icons
│   ├── GoogleService-Info.plist # Firebase configuration
├── AnonymousConfessionApp.xcodeproj/ # Xcode project file
├── README.md                # This file

🤝 Contributing
We welcome contributions to make Confession-X even better! To contribute:

Fork the repository.
Create a new branch (git checkout -b feature/YourFeature).
Commit your changes (git commit -m "Add YourFeature").
Push to the branch (git push origin feature/YourFeature).
Open a Pull Request on GitHub.

Please follow the Code of Conduct and ensure your code adheres to the project's style guidelines.
📜 License
This project is licensed under the MIT License. See the LICENSE file for details.
📬 Contact

Author: Abhinav Anand
GitHub: AbhinavAnand241201
Email: iabhinavanandworks@gmail.com


Confession-X: Where secrets find a voice, and stories connect us all.Star ⭐ this repo if you love it!
