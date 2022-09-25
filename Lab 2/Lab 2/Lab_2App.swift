//
//  Lab_2App.swift
//  Lab 2
//
//  Created by Cary Wang on 9/25/22.
//

import SwiftUI

@main
struct Lab_2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
