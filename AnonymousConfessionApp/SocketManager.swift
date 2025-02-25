import Foundation
import SocketIO

class SocketManager: ObservableObject {
    private var manager: SocketManager!
    private var socket: SocketIOClient!

    @Published var notifications: [String] = []

    init() {
        manager = SocketManager(socketURL: URL(string: "http://localhost:5000")!, config: [.log(true), .compress])
        socket = manager.defaultSocket

        socket.on(clientEvent: .connect) { data, ack in
            print("Socket connected")
        }

        socket.on("receiveNotification") { [weak self] data, ack in
            if let notification = data[0] as? String {
                self?.notifications.append(notification)
            }
        }

        socket.connect()
    }

    func sendNotification(_ notification: String) {
        socket.emit("sendNotification", notification)
    }
}