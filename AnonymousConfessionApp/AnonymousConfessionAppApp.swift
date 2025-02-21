//
//  AnonymousConfessionAppApp.swift
//  AnonymousConfessionApp
//
//  Created by ABHINAV ANAND  on 21/02/25.
//

import SwiftUI

@main
struct AnonymousConfessionAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
