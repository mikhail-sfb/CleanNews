//
//  NewsModelProtocol.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 1.04.25.
//

import Foundation

protocol NewsModelProtocol {
    var source: [String: String]? { get }
    var author: String? { get }
    var title: String? { get }
    var description: String? { get }
    var url: URL? { get }
    var imageURL: URL? { get }
    var publishedAt: Date? { get }
    var content: String? { get }
}
