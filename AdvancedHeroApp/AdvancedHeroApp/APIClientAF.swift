//
//  APIClientAF.swift
//  AdvancedHeroApp
//
//  Created by Verena Gaaze on 04.12.2025.
//
import Alamofire

final class APIClientAF {
    static let shared = APIClientAF()
    private init() {}

    private let allHeroesURL = "https://akabab.github.io/superhero-api/api/all.json"

    func fetchAllHeroes(completion: @escaping (Result<[Superhero], Error>) -> Void) {
        AF.request(allHeroesURL)
            .validate()
            .responseDecodable(of: [Superhero].self) { response in
                switch response.result {
                case .success(let heroes):
                    completion(.success(heroes))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
