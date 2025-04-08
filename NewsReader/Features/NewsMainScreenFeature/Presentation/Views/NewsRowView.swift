//
//  NewsRowView.swift
//  NewsApp
//
//  Created by Michail Malashkevich on 6.04.25.
//

import SwiftUI

struct NewsRowView: View {
    @EnvironmentObject private var bookmarksViewModel: BookmarkViewModel

    let news: News

    var body: some View {
        NavigationLink {
            NewsDetailView(news: news, dismissOnToggle: false) {
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

                    Text(news.description ?? "No description")
                        .font(.subheadline)
                        .lineLimit(2)
                }
            }
            .padding(.horizontal)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
