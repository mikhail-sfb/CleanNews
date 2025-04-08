//
//  BookmarkViewModel.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import Foundation

@MainActor
final class BookmarkViewModel: ObservableObject {
    @Published var bookmarks: [News] = []
    @Published var showingErrorAlert = false
    @Published var isLoading = false
    
    var errorMessage: String?
    
    private let addBookmarkUseCase: AddBookmarkUsecase
    private let fetchBookmarksUseCase: FetchBookmarksUsecase
    private let removeBookmarkUseCase: RemoveBookmarkUsecase
    
    init(
        addBookmarkUseCase: AddBookmarkUsecase,
        fetchBookmarksUseCase: FetchBookmarksUsecase,
        removeBookmarkUseCase: RemoveBookmarkUsecase
    ) {
        self.addBookmarkUseCase = addBookmarkUseCase
        self.fetchBookmarksUseCase = fetchBookmarksUseCase
        self.removeBookmarkUseCase = removeBookmarkUseCase
    }
    
    func addBookmark(_ news: News) async {
        isLoading = true
        defer { isLoading = false }
        
        let bookmarkedNews = news.copyWith(isFavorite: true)
        
        let result = await addBookmarkUseCase.execute(bookmarkedNews)
        handleResult(result)
    }
    
    func fetchBookmarks() async {
        isLoading = true
        defer { isLoading = false }
        
        let result = await fetchBookmarksUseCase.execute(())
        
        switch result {
        case .success(let bookmarks):
            self.bookmarks = bookmarks
        case .failure(let error):
            showingErrorAlert = true
            errorMessage = error.localizedDescription
        }
    }
    
    func removeBookmark(_ news: News) async {
        isLoading = true
        defer { isLoading = false }
                
        let result = await removeBookmarkUseCase.execute(news.id)
        handleResult(result)
    }
    
    private func handleResult(_ result: Result<Void, Error>) {
        switch result {
        case .success:
            break
        case .failure(let error):
            showingErrorAlert = true
            errorMessage = error.localizedDescription
        }
    }
}
