//
//  NewsAPIService.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 1.04.25.
//

import Foundation

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [NewsDTO]
}

final class NewsAPIService: NewsAPIServiceProtocol {
    func fetchNews(_ topic: String = "Apple") async throws -> [NewsDTO] {
        do {
            guard let url = createNewsURL(topic) else {
                throw NewsAPIExceptions.invalidURL
            }

            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse,
                200...299 ~= httpResponse.statusCode
            else {
                throw NewsAPIExceptions.invalidStatusCode(
                    (response as? HTTPURLResponse)?.statusCode ?? -1
                )
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedData = try decoder.decode(NewsResponse.self, from: data)

            return decodedData.articles
        } catch let error as DecodingError {
            throw NewsAPIExceptions.decodingError(error)
        } catch {
            throw NewsAPIExceptions.invalidResponse
        }
    }

    private func createNewsURL(_ topic: String) -> URL? {
        var urlComponents = URLComponents(string: APIKeys.newsApiUrl)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let fromDate = dateFormatter.string(
            from: Calendar.current.date(byAdding: .day, value: -7, to: Date())
                ?? Date())

        urlComponents?.queryItems = [
            URLQueryItem(name: "q", value: topic),
            URLQueryItem(name: "from", value: fromDate),
            URLQueryItem(name: "sortBy", value: "popularity"),
            URLQueryItem(name: "apiKey", value: APIKeys.newsApiKey),
        ]

        return urlComponents?.url
    }
}
