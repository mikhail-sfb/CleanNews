//
//  BookmarkToolbarButton.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import SwiftUI

struct BookmarkToolbarButton: ToolbarContent {
    let isFavorite: Bool
    let action: () -> Void

    var body: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Button {
                action()
            } label: {
                Image(systemName: isFavorite ? "bookmark.fill" : "bookmark")
                    .symbolEffect(.bounce, value: isFavorite)
                    .foregroundColor(isFavorite ? .blue : .primary)
            }
        }
    }
}
