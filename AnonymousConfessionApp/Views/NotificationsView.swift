import SwiftUI

struct NotificationsView: View {
    @StateObject private var socketManager = SocketManager()

    var body: some View {
        NavigationView {
            List(socketManager.notifications, id: \.self) { notification in
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
