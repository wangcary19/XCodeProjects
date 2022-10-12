//
//  Lab_5App.swift
//  Lab 5
//
//  Created by Cary Wang on 10/12/22.
//

import SwiftUI

@main
struct Lab_5App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
