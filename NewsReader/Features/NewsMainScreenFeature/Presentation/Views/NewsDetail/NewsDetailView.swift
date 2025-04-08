//
//  NewsDetailView.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 6.04.25.
//

import SwiftUI

struct NewsDetailView: View {    
    let news: News
    let dismissOnToggle: Bool
    let toolBarAction: () -> Void
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                NewsDetailHeaderView(imageURL: news.imageURL)

                NewsMetadataView(
                    title: news.title,
                    author: news.author,
                    source: news.source?["name"],
                    date: news.publishedAt
                )

                Divider()

                NewsContentView(content: news.content)

                NewsOriginalLinkView(url: news.url)
            }
            .padding(.bottom)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            BookmarkToolbarButton() {
                if dismissOnToggle {
                    toolBarAction()
                    dismiss()
                } else {
                    toolBarAction()
                }
            }
        }
    }
}
