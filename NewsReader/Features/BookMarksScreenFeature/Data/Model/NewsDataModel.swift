//
//  NewsDataModel.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import CoreData

public class NewsDataModel: NSManagedObject {
    @NSManaged public var urlString: String?
    @NSManaged public var title: String?
    @NSManaged public var sourceName: String?
    @NSManaged public var sourceID: String?
    @NSManaged public var publishedAt: Date?
    @NSManaged public var imageURLString: String?
    @NSManaged public var id: UUID?
    @NSManaged public var desc: String?
    @NSManaged public var content: String?
    @NSManaged public var author: String?
}

extension NewsDataModel {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsDataModel> {
        return NSFetchRequest<NewsDataModel>(entityName: "NewsDataModel")
    }
    
    public static func create(
        context: NSManagedObjectContext,
        urlString: String? = nil,
        title: String? = nil,
        sourceName: String? = nil,
        sourceID: String? = nil,
        publishedAt: Date? = nil,
        imageURLString: String? = nil,
        id: UUID? = nil,
        desc: String? = nil,
        content: String? = nil,
        author: String? = nil
    ) -> NewsDataModel {
        let newsItem = NewsDataModel(context: context)
        newsItem.urlString = urlString
        newsItem.title = title
        newsItem.sourceName = sourceName
        newsItem.sourceID = sourceID
        newsItem.publishedAt = publishedAt
        newsItem.imageURLString = imageURLString
        newsItem.id = id ?? UUID()
        newsItem.desc = desc
        newsItem.content = content
        newsItem.author = author
        return newsItem
    }
}

extension NewsDataModel {
    func toNews() -> News {
        News(
            id: id ?? UUID(),
            source: ["id": sourceID ?? "", "name": sourceName ?? ""],
            author: author,
            title: title,
            description: desc,
            url: URL(string: urlString ?? ""),
            imageURL: URL(string: imageURLString ?? ""),
            publishedAt: publishedAt,
            content: content,
            isFavorite: true
        )
    }
}
