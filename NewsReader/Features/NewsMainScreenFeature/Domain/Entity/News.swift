//
//  News.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 1.04.25.
//

import Foundation

struct News: Identifiable, NewsModelProtocol {
    let id: UUID
    let source: [String: String]?
    let author: String?
    let title: String?
    let description: String?
    let url: URL?
    let imageURL: URL?
    let publishedAt: Date?
    let content: String?
    var isFavorite: Bool

    init(
        id: UUID = UUID(),
        source: [String: String]?,
        author: String?,
        title: String?,
        description: String?,
        url: URL?,
        imageURL: URL?,
        publishedAt: Date?,
        content: String?,
        isFavorite: Bool = false
    ) {
        self.id = id
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.imageURL = imageURL
        self.publishedAt = publishedAt
        self.content = content
        self.isFavorite = isFavorite
    }

    func copyWith(
        id: UUID? = nil,
        source: [String: String]?? = nil,
        author: String?? = nil,
        title: String?? = nil,
        description: String?? = nil,
        url: URL?? = nil,
        imageURL: URL?? = nil,
        publishedAt: Date?? = nil,
        content: String?? = nil,
        isFavorite: Bool? = nil
    ) -> News {
        return News(
            id: id ?? self.id,
            source: source ?? self.source,
            author: author ?? self.author,
            title: title ?? self.title,
            description: description ?? self.description,
            url: url ?? self.url,
            imageURL: imageURL ?? self.imageURL,
            publishedAt: publishedAt ?? self.publishedAt,
            content: content ?? self.content,
            isFavorite: isFavorite ?? self.isFavorite
        )
    }
}
