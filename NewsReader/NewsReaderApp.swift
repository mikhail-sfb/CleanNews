//
//  NewsReaderApp.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import SwiftUI

@main
struct NewsReaderApp: App {
    @StateObject private var bookmarksViewModel = BookmarkDependencyContainer.makeBookmarkViewModel()
    
    let coreDataService = CoreDataService.shared

    var body: some Scene {
        WindowGroup {
            TabsView()
                .environment(\.managedObjectContext, coreDataService.context)
                .environmentObject(bookmarksViewModel)
        }
    }
}
