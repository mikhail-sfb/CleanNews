//
//  NewsDetailHeaderView.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import SwiftUI

struct NewsDetailHeaderView: View {
    let imageURL: URL?
    
    var body: some View {
        CachedAsyncImageView(url: imageURL)
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: 250)
            .clipped()
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
            .padding(.horizontal)
            .padding(.top)
    }
}
