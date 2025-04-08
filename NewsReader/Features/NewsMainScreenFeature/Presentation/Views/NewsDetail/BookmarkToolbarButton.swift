//
//  BookmarkToolbarButton.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import SwiftUI

struct BookmarkToolbarButton: ToolbarContent {
    let action: () -> Void

    var body: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Button {
                action()
            } label: {
                Image(systemName: "bookmark.fill")
                    .foregroundColor(.blue)
            }
        }
    }
}
