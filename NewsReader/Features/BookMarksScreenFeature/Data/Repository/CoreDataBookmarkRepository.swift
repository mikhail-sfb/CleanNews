//
//  CoreDataBookmarkRepository.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import CoreData

final class CoreDataBookmarkRepository: BookmarkRepository {
    private let coreDataService: CoreDataServiceProtocol
    
    init(coreDataService: CoreDataServiceProtocol = CoreDataService.shared) {
        self.coreDataService = coreDataService
    }
    
    func addBookmark(_ news: News) async -> Result<Void, Error> {
        await coreDataService.context.perform {
            let fetchRequest = NSFetchRequest<NewsDataModel>(entityName: "NewsDataModel")
            fetchRequest.predicate = NSPredicate(format: "id == %@", news.id as CVarArg)
            
            do {
                let existingBookmarks = try self.coreDataService.context.fetch(fetchRequest)
                
                if let existingBookmark = existingBookmarks.first {
                    self.coreDataService.context.delete(existingBookmark)
                    
                    try self.coreDataService.context.save()
                    
                    return .success(())
                } else {
                    let entity = NewsDataModel(context: self.coreDataService.context)
                    
                    entity.id = news.id
                    entity.sourceID = news.source?["id"]
                    entity.sourceName = news.source?["name"]
                    entity.author = news.author
                    entity.title = news.title
                    entity.desc = news.description
                    entity.urlString = news.url?.absoluteString
                    entity.imageURLString = news.imageURL?.absoluteString
                    entity.publishedAt = news.publishedAt
                    entity.content = news.content
                    
                    // Save the context to persist the new bookmark
                    try self.coreDataService.context.save()
                    
                    return .success(())
                }
            } catch {
                self.coreDataService.context.rollback()
                return .failure(error)
            }
        }
    }
    
    func fetchAllBookmarks() async -> Result<[News], Error> {
        await coreDataService.context.perform {
            let request = NSFetchRequest<NewsDataModel>(entityName: "NewsDataModel")
            
            do {
                let result = try self.coreDataService.context.fetch(request)
                return .success(result.map { $0.toNews() })
            } catch {
                return .failure(error)
            }
        }
    }
    
    func deleteBookmark(with id: UUID) async -> Result<Void, Error> {
        await coreDataService.context.perform {
            let request = NSFetchRequest<NewsDataModel>(entityName: "NewsDataModel")
            request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
            
            do {
                let result = try self.coreDataService.context.fetch(request)
                
                guard let bookmark = result.first else {
                    return .failure(CoreDataError.bookmarkNotFound)
                }
                
                self.coreDataService.context.delete(bookmark)
                
                try self.coreDataService.context.save()
                
                return .success(())
            } catch {
                self.coreDataService.context.rollback()
                return .failure(error)
            }
        }
    }
}
