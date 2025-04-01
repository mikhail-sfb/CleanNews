//
//  NewsMainScreen.swift
//  NewsApp
//
//  Created by Michail Malashkevich on 1.04.25.
//

final class DependencyContainer {
    static let shared = DependencyContainer()
    private let newsAPIService: NewsAPIServiceProtocol

    init(newsAPIService: NewsAPIServiceProtocol = NewsAPIService()) {
        self.newsAPIService = newsAPIService
    }

    func makeNewsRepository() -> NewsAPIRepositoryProtocol {
        NewsAPIRepository(newsAPIService: newsAPIService)
    }

    func makeFetchNewsUseCase() -> FetchNewsUsecase {
        FetchNewsUsecase(newsRepository: makeNewsRepository())
    }

    @MainActor
    func makeNewsViewModel() -> NewsViewModel {
        NewsViewModel(fetchUseCase: makeFetchNewsUseCase())
    }
}
