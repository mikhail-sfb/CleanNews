//
//  FetchBookmarksUsecase.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

final class FetchBookmarksUsecase: Usecase {
    typealias Input = Void
    typealias Output = [News]
    
    private let bookmarkRepository: BookmarkRepository
    
    init(bookmarkRepository: BookmarkRepository) {
        self.bookmarkRepository = bookmarkRepository
    }
    
    func execute(_ input: Void) async -> Result<[News], Error> {
        await bookmarkRepository.fetchAllBookmarks()
    }
}
