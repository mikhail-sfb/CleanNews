//
//  NewsAPIRepositoryImplementation.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 1.04.25.
//

import Foundation

final class NewsAPIRepository: NewsAPIRepositoryProtocol {
    private let newsAPIService: NewsAPIServiceProtocol

    init(newsAPIService: NewsAPIServiceProtocol) {
        self.newsAPIService = newsAPIService
    }

    func fetchNews(_ topic: String) async -> Result<[News], Error> {
        do {
            let result = try await newsAPIService.fetchNews(topic)
            return .success(
                result.map { News(from: $0) })
        } catch {
            print(error)
            return .failure(error)
        }
    }
}
