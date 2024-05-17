//
//  dragonradarApp.swift
//  dragonradar
//
//  Created by Rubén Gómez Olivencia on 13/5/24.
//

import SwiftUI
import SwiftData

@main
struct dragonradarApp: App {
    @StateObject private var locationManager = LocationManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Game.self])
                .environmentObject(locationManager)
        }
    }
}
