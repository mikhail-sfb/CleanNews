//
//  News+Extensions.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import Foundation

extension News {
    init(from protocolModel: NewsModelProtocol, isFavorite: Bool = false) {
        self.init(
            source: protocolModel.source,
            author: protocolModel.author,
            title: protocolModel.title,
            description: protocolModel.description,
            url: protocolModel.url,
            imageURL: protocolModel.imageURL,
            publishedAt: protocolModel.publishedAt,
            content: protocolModel.content,
            isFavorite: isFavorite
        )
    }
}
