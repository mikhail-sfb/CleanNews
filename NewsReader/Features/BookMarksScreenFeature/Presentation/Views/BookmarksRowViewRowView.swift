//
//  BookmarksRowViewRowView.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import SwiftUI

struct BookmarksRowView: View {
    @EnvironmentObject private var bookmarksViewModel: BookmarkViewModel
    @Environment(\.dismiss) var dismiss

    let news: News

    var body: some View {
        NavigationLink {
            NewsDetailView(news: news, dismissOnToggle: true) {
                Task {
                    if news.isFavorite {
                        await bookmarksViewModel.removeBookmark(news)
                    } else {
                        await bookmarksViewModel.addBookmark(news)
                    }
                }
            }
        } label: {
            HStack {
                CachedAsyncImageView(url: news.imageURL)
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)

                VStack(alignment: .leading) {
                    Text(news.title ?? "No title")
                        .font(.headline)
                        .lineLimit(2)
                }
            }
            .padding(.horizontal)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
