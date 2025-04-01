//
//  APIExceptions.swift
//  NewsApp
//
//  Created by Michail Malashkevich on 1.04.25.
//

enum NewsAPIExceptions: Error {
    case invalidResponse
    case invalidURL
    case decodingError(Error)
    case networkError(Error)
}
