//
//  ImageLoader.swift
//  HeroRandomizerApp
//
//  Created by Verena Gaaze on 02.12.2025.
//
import UIKit

final class ImageLoader {
    static let shared = ImageLoader()
    private let cache = NSCache<NSURL, UIImage>()
    private init() {}
    
    func loadImage(from urlString: String?, completion: @escaping (UIImage?) -> Void) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        if let cached = cache.object(forKey: url as NSURL) {
            completion(cached)
            return
        }
        URLSession.shared.dataTask(with: url) { data, resp, error in
            if let data = data, let img = UIImage(data: data) {
                self.cache.setObject(img, forKey: url as NSURL)
                DispatchQueue.main.async { completion(img) }
            } else {
                DispatchQueue.main.async { completion(nil) }
            }
        }.resume()
    }
}
