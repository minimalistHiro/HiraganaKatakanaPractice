//
//  DrawPoints.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/07.
//

import SwiftUI
import CoreData

struct DrawPoints: Identifiable, Equatable {
    var id: UUID = UUID()
    var points: [CGPoint]
}

enum TappedButtons: String, CaseIterable {
    case tappedSetting
}

struct AlertEntity {
    // アラートボタンの個数
    enum AlertButton {
        case single
        case double
    }
    let title: String
    let message: String
    let actionText: String
    let cancelText: String
    let button: AlertButton
}

struct PersistenceController {
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Model")
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}
