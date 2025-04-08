//
//  APIExceptions.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 1.04.25.
//

enum NewsAPIExceptions: Error {
    case invalidResponse
    case invalidURL
    case networkError
    case invalidStatusCode(Int)
    case decodingError(Error)
}
