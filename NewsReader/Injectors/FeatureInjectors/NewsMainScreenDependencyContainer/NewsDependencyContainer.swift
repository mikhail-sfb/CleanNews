//
//  NewsDependencyContainer.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 1.04.25.
//

private protocol NewsDependencyProvider {
    static func makeNewsAPIService() -> NewsAPIServiceProtocol
    static func makeNewsRepository() -> NewsAPIRepositoryProtocol
    static func makeFetchNewsUseCase() -> FetchNewsUsecase
    @MainActor static func makeNewsViewModel() -> NewsViewModel
}

final class NewsDependencyContainer: NewsDependencyProvider {
    fileprivate static func makeNewsAPIService() -> NewsAPIServiceProtocol {
        NewsAPIService()
    }
    
    fileprivate static func makeNewsRepository() -> NewsAPIRepositoryProtocol {
        NewsAPIRepository(newsAPIService: makeNewsAPIService())
    }
    
    fileprivate static func makeFetchNewsUseCase() -> FetchNewsUsecase {
        FetchNewsUsecase(newsRepository: makeNewsRepository())
    }
    
    @MainActor static func makeNewsViewModel() -> NewsViewModel {
        NewsViewModel(fetchUseCase: makeFetchNewsUseCase())
    }
}
