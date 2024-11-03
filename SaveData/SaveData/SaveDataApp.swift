//
//  SaveDataApp.swift
//  SaveData
//
//  Created by Long Vu on 3/11/24.
//

import SwiftUI
import SwiftData

@main
struct SaveDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
