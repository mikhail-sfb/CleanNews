//
//  News.swift
//  NewsApp
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

    init(from protocolModel: NewsModelProtocol, isFavorite: Bool = false) {
        self.id = UUID()
        self.source = protocolModel.source
        self.author = protocolModel.author
        self.title = protocolModel.title
        self.description = protocolModel.description
        self.url = protocolModel.url
        self.imageURL = protocolModel.imageURL
        self.publishedAt = protocolModel.publishedAt
        self.content = protocolModel.content
        self.isFavorite = isFavorite
    }
}
