//
//  ImageCache.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 6.04.25.
//

import UIKit

final class ImageCache {
    static let shared = ImageCache()
    private let cache = NSCache<NSURL, UIImage>()
    
    private init() {}
    
    func image(for url: URL) -> UIImage? {
        cache.object(forKey: url as NSURL)
    }
    
    func saveImage(_ image: UIImage, for url: URL) {
        cache.setObject(image, forKey: url as NSURL)
    }
}
