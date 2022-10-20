//
//  Lab_6App.swift
//  Lab 6
//
//  Created by Cary Wang on 10/19/22.
//

import SwiftUI

@main
struct Lab_6App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
