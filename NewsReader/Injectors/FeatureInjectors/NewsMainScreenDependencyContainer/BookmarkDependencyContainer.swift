//
//  BookmarkDependencyContainer.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

private protocol BookmarkDependencyProvider {
    static func makeCoreDataService() -> CoreDataServiceProtocol
    static func makeBookmarkRepository() -> BookmarkRepository
    static func makeAddBookmarkUseCase() -> AddBookmarkUsecase
    static func makeFetchBookmarksUseCase() -> FetchBookmarksUsecase
    static func makeRemoveBookmarkUseCase() -> RemoveBookmarkUsecase
    @MainActor static func makeBookmarkViewModel() -> BookmarkViewModel
}

final class BookmarkDependencyContainer: BookmarkDependencyProvider {
    fileprivate static func makeCoreDataService() -> CoreDataServiceProtocol {
        CoreDataService.shared
    }
    
    fileprivate static func makeBookmarkRepository() -> BookmarkRepository {
        CoreDataBookmarkRepository(coreDataService: makeCoreDataService())
    }
    
    fileprivate static func makeAddBookmarkUseCase() -> AddBookmarkUsecase {
        AddBookmarkUsecase(bookmarkRepository: makeBookmarkRepository())
    }
    
    fileprivate static func makeFetchBookmarksUseCase() -> FetchBookmarksUsecase {
        FetchBookmarksUsecase(bookmarkRepository: makeBookmarkRepository())
    }
    
    fileprivate static func makeRemoveBookmarkUseCase() -> RemoveBookmarkUsecase {
        RemoveBookmarkUsecase(bookmarkRepository: makeBookmarkRepository())
    }
    
    @MainActor static func makeBookmarkViewModel() -> BookmarkViewModel {
        BookmarkViewModel(
            addBookmarkUseCase: makeAddBookmarkUseCase(),
            fetchBookmarksUseCase: makeFetchBookmarksUseCase(),
            removeBookmarkUseCase: makeRemoveBookmarkUseCase()
        )
    }
}
