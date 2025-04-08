//
//  ImageLoader.swift
//  NewsReader
//
//  Created by Michail Malashkevich on 6.04.25.
//

import SwiftUI

@MainActor
final class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private var currentTask: Task<Void, Never>?
    
    func loadImage(from url: URL) {
        currentTask?.cancel()
        
        if let cachedImage = ImageCache.shared.image(for: url) {
            image = cachedImage
            return
        }
        
        currentTask = Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let image = UIImage(data: data) else { return }
                
                ImageCache.shared.saveImage(image, for: url)
                
                if !Task.isCancelled {
                    self.image = image
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func cancel() {
        currentTask?.cancel()
    }
}
