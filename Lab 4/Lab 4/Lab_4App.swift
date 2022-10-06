//
//  Lab_4App.swift
//  Lab 4
//
//  Created by Cary Wang on 10/5/22.
//

import SwiftUI

@main
struct Lab_4App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
