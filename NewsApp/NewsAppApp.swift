//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Michail Malashkevich on 1.04.25.
//

import SwiftUI

@main
struct NewsAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
