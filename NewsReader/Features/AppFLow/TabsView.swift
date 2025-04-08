//
//  TabsView.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 1.04.25.
//

import SwiftUI

struct TabsView: View {
    @StateObject private var newsViewModel =
        NewsDependencyContainer.makeNewsViewModel()

    var body: some View {
        TabView {
            NavigationView {
                NewsListViewScreen(newsListViewModel: newsViewModel)
            }
            .tabItem {
                Label("News", systemImage: "newspaper")
            }

            NavigationView {
                BookmarksListViewScreen()
            }
            .tabItem {
                Label("Marks", systemImage: "bookmark.fill")
            }
        }

    }
}
