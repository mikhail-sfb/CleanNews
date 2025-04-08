//
//  BookmarksListViewScreen.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import SwiftUI

struct BookmarksListViewScreen: View {
    @EnvironmentObject private var bookmarksViewModel: BookmarkViewModel
    
    var body: some View {
        VStack {
            Group {
                if bookmarksViewModel.isLoading {
                    LoadingView()
                } else if bookmarksViewModel.bookmarks.isEmpty {
                    EmptyBookmarksView()
                } else {
                    BookmarksList(
                        bookmarks: bookmarksViewModel.bookmarks
                    )
                }
            }
            .navigationTitle("Saved Bookmarks")
            .alert("Error", isPresented: $bookmarksViewModel.showingErrorAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(bookmarksViewModel.errorMessage ?? "Unknown error")
            }
            .task {
                await bookmarksViewModel.fetchBookmarks()
            }
        }
    }
}
