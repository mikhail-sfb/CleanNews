//
//  FetchNewsUsecase.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 1.04.25.
//

final class FetchNewsUsecase: Usecase {
    typealias Input = String
    typealias Output = [News]
    
    private let newsRepository: NewsAPIRepositoryProtocol
    
    init(newsRepository: NewsAPIRepositoryProtocol) {
        self.newsRepository = newsRepository
    }
    
    func execute(_ input: String) async -> Result<[News], Error> {
        return await newsRepository.fetchNews(input)
    }
}
