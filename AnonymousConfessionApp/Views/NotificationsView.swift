import SwiftUI

struct NotificationsView: View {
    @State private var notifications: [String] = [
        "JohnDoe liked your confession.",
        "JaneDoe commented on your confession.",
        "New confession posted by JohnDoe."
    ]

    var body: some View {
        NavigationView {
            List(notifications, id: \.self) { notification in
                Text(notification)
                    .font(.custom("Avenir", size: 16))
            }
            .navigationTitle("Notifications")
        }
    }
}

// Preview Provider
struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}