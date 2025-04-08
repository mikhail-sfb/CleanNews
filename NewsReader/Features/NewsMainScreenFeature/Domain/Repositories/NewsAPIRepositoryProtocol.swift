//
//  NewsAPIRepositoryProtocol.swift.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 1.04.25.
//

protocol NewsAPIRepositoryProtocol {
    func fetchNews(_ topic: String) async -> Result<[News], Error>
}
