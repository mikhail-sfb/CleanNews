//
//  KeyedDecodingContainer.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 1.04.25.
//

extension KeyedDecodingContainer {
    func safeDecode<T: Decodable>(_ type: T.Type, forKey key: Key) -> T? {
        do {
            return try self.decodeIfPresent(T.self, forKey: key)
        } catch {
            return nil
        }
    }
}
