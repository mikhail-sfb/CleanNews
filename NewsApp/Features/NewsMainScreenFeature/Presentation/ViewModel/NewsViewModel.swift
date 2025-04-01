//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Michail Malashkevich on 1.04.25.
//

import Foundation

@MainActor
final class NewsViewModel: ObservableObject {
    @Published var news: [News] = []
    @Published var errorMessage: String?

    let fetchUseCase: FetchNewsUsecase

    init(fetchUseCase: FetchNewsUsecase) {
        self.fetchUseCase = fetchUseCase
    }

    func fetchNews(newsTopic: String) async {
        let result = await fetchUseCase.execute(newsTopic)

        switch result {
        case .success(let news):
            self.news = news
        case .failure(let error):
            errorMessage = error.localizedDescription
        }
    }
}
