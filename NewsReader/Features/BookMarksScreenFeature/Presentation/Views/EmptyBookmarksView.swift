//
//  EmptyBookmarksView.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 8.04.25.
//

import SwiftUI

struct EmptyBookmarksView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "bookmark.slash")
                .font(.system(size: 48))
                .foregroundColor(.gray)
            Text("No Bookmarks Yet")
                .font(.title2)
            Text("Save news articles to see them here")
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
