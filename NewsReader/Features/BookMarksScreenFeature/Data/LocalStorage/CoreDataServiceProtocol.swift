//
//  CoreDataServiceProtocol.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 7.04.25.
//

import CoreData

protocol CoreDataServiceProtocol {
    var context: NSManagedObjectContext { get }
    var persistentContainer: NSPersistentContainer { get }
    func saveContext()
}
