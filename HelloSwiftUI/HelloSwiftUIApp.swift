//
//  HelloSwiftUIApp.swift
//  HelloSwiftUI
//
//  Created by Antonio Flores on 26/01/24.
//

import SwiftUI

@main
struct HelloSwiftUIApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .environmentObject(appState)
            }
        }
    }
}
