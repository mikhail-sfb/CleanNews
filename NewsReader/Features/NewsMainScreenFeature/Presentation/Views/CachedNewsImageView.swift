//
//  CachedNewsImageView.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 6.04.25.
//

import SwiftUI

struct CachedAsyncImageView: View {
    @StateObject private var loader = ImageLoader()

    let url: URL?
    
    var body: some View {
        Group {
            if let url = url {
                if let image = loader.image {
                    Image(uiImage: image)
                        .resizable()
                } else {
                    ProgressView()
                        .onAppear { loader.loadImage(from: url) }
                        .onDisappear { loader.cancel() }
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
            }
        }
    }
}
