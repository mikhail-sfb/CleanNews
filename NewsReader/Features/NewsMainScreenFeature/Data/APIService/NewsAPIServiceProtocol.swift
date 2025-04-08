//
//  NewsAPIServiceProtocol.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 1.04.25.
//


protocol NewsAPIServiceProtocol {
    func fetchNews(_ topic: String) async throws -> [NewsDTO]
}
