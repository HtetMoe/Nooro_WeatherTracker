//
//  WeatherTrackerApp.swift
//  WeatherTracker
//
//  Created by Htet Moe Phyu on 1/28/25.
//

import SwiftUI

@main
struct WeatherTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
