//
//  NewsModel.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 1.04.25.
//

import Foundation

struct NewsDTO: Decodable, NewsModelProtocol {
    let source: [String: String]?
    let author: String?
    let title: String?
    let description: String?
    let url: URL?
    let imageURL: URL?
    let publishedAt: Date?
    let content: String?

    private enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, publishedAt, content
        case imageURL = "urlToImage"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.source = container.safeDecode([String: String].self, forKey: .source)
        self.author = container.safeDecode(String.self, forKey: .author)
        self.title = container.safeDecode(String.self, forKey: .title)
        self.description = container.safeDecode(String.self, forKey: .description)
        self.url = container.safeDecode(URL.self, forKey: .url)
        self.imageURL = container.safeDecode(URL.self, forKey: .imageURL)
        self.publishedAt = container.safeDecode(Date.self, forKey: .publishedAt)
        self.content = container.safeDecode(String.self, forKey: .content)
    }
}
