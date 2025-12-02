//
//  APIClient.swift
//  HeroRandomizerApp
//
//  Created by Verena Gaaze on 02.12.2025.
//

import Foundation

enum APIError: Error {
    case badURL, requestFailed(Error), invalidData, decodingError(Error)
}

final class APIClient {
    static let shared = APIClient()
    private init(){}
    
    private let allHeroesURL = URL(string: "https://akabab.github.io/superhero-api/api/all.json")!
    
    func fetchAllHeroes(completion: @escaping (Result<[Superhero], APIError>) -> Void) {
        let task = URLSession.shared.dataTask(with: allHeroesURL) { data, response, error in
            if let err = error {
                completion(.failure(.requestFailed(err)))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let heroes = try decoder.decode([Superhero].self, from: data)
                completion(.success(heroes))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
        task.resume()
    }
}
