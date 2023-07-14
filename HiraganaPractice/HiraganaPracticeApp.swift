//
//  HiraganaPracticeApp.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/07.
//

import SwiftUI

@main
struct HiraganaPracticeApp: App {
    let persistenceController = PersistenceController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
