//
//  AddBookmarkUsecase.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

final class AddBookmarkUsecase: Usecase {
    typealias Input = News
    typealias Output = Void
    
    private let bookmarkRepository: BookmarkRepository
    
    init(bookmarkRepository: BookmarkRepository) {
        self.bookmarkRepository = bookmarkRepository
    }
    
    func execute(_ input: News) async -> Result<Void, Error> {
        await bookmarkRepository.addBookmark(input)
    }
}
