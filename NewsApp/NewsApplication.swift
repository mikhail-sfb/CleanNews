//
//  NewsApplication.swift
//  NewsApp
//
//  Created by Michail Malashkevich on 1.04.25.
//

import SwiftUI

@main
struct NewsApplication: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NewsListView()
          //  TestView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
