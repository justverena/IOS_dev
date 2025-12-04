//
//  HeroStorage.swift
//  AdvancedHeroApp
//
//  Created by Verena Gaaze on 04.12.2025.
//
import Foundation

final class HeroStorage {
    static let shared = HeroStorage()
    private init() {}

    private let lastHeroKey = "lastHeroID"

    func saveLastHeroID(_ id: Int?) {
        UserDefaults.standard.set(id, forKey: lastHeroKey)
    }

    func loadLastHeroID() -> Int? {
        return UserDefaults.standard.integer(forKey: lastHeroKey)
    }
}
