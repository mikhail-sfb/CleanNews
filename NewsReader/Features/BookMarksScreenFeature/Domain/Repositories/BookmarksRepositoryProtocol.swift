//
//  BookmarksRepositoryProtocol.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import Foundation

protocol BookmarkRepository {
    func addBookmark(_ news: NewsModelProtocol) async -> Result<Void, Error>
    func fetchAllBookmarks() async -> Result<[News], Error>
    func deleteBookmark(with id: UUID) async -> Result<Void, Error>
}
