//
//  NewsMainScreen.swift
//  NewsApp
//
//  Created by Michail Malashkevich on 1.04.25.
//

final class DependencyContainer {
    static let shared = DependencyContainer()
    
    private init() {}
    
    private lazy var newsAPIService: NewsAPIServiceProtocol = {
        NewsAPIService()
    }()
    
    private lazy var newsRepository: NewsAPIRepositoryProtocol = {
        NewsAPIRepository(newsAPIService: newsAPIService)
    }()
    
    func makeFetchNewsUseCase() -> FetchNewsUsecase {
        FetchNewsUsecase(newsRepository: newsRepository)
    }
}
