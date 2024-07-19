//
//  NetworkManager.swift
//  Zomato
//
//  Created by Esakki-IOS on 19/07/20.
//
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let ZomatiersURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers() async throws -> [Zomatiers] {
        guard let url = URL(string: ZomatiersURL) else { throw APError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ZomatiersResponse.self, from: data).request
        } catch {
            throw APError.invalidData
        }
    }
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ) {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) { completed(image); return }
        guard let url = URL(string: urlString) else { completed(nil); return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data, let image = UIImage(data: data) else { completed(nil); return }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
