//
//  Lab_3App.swift
//  Lab 3
//
//  Created by Cary Wang on 9/25/22.
//

import SwiftUI

@main
struct Lab_3App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
