//
//  ShelffleApp.swift
//  Shelffle
//
//  Created by Cary Wang on 10/20/22.
//

import SwiftUI

@main
struct ShelffleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
