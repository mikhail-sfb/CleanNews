//
//  BookmarksList.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 8.04.25.
//

import SwiftUI

struct BookmarksList: View {
    let bookmarks: [News]
    
    var body: some View {
        List {
            ForEach(bookmarks) { news in
                BookmarksRowView(news: news)
                    .padding(.vertical, 8)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
    }
}
