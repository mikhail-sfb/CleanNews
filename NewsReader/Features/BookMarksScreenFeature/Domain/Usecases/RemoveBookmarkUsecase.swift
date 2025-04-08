//
//  RemoveBookmarkUsecase.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import Foundation

final class RemoveBookmarkUsecase: Usecase {
    typealias Input = UUID
    typealias Output = Void
    
    private let bookmarkRepository: BookmarkRepository
    
    init(bookmarkRepository: BookmarkRepository) {
        self.bookmarkRepository = bookmarkRepository
    }
    
    func execute(_ input: UUID) async -> Result<Void, Error> {
        await bookmarkRepository.deleteBookmark(with: input)
    }
}
