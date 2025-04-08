//
//  NewsViewModel.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 1.04.25.
//

import Foundation

@MainActor
final class NewsViewModel: ObservableObject {
    @Published var news: [News] = []
    @Published var showingErrorAlert = false
    @Published var isLoading: Bool = false

    var errorMessage: String?
    
    let fetchUseCase: FetchNewsUsecase

    init(fetchUseCase: FetchNewsUsecase) {
        self.fetchUseCase = fetchUseCase
    }

    func fetchNews(newsTopic: String) async {
        isLoading = true
        showingErrorAlert = false
        let result = await fetchUseCase.execute(newsTopic)

        switch result {
        case .success(let news):
            self.news = news
        case .failure(let error):
            showingErrorAlert = true
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
    
    func toggleFavoriteStatus(for id: UUID) {
        if let index = news.firstIndex(where: { $0.id == id }) {
            news[index] = news[index].copyWith(isFavorite: !news[index].isFavorite)
        }
    }
}
