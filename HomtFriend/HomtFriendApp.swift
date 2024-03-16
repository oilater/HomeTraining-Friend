//
//  HomtFriendApp.swift
//  HomtFriend
//
//  Created by 김성현 on 3/11/24.
//

import SwiftUI
import SwiftData

@main
struct HomtFriendApp: App {
    var sharedModelContainer : ModelContainer = {
        let schema = Schema([
            Exercise.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
