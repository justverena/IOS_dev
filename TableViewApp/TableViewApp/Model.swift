//
//  Model.swift
//  TableViewApp
//
//  Created by Verena Gaaze on 14.11.2025.
//

import UIKit

enum FavoriteSection: Int, CaseIterable {
    case movies = 0, music, books, courses

    var title: String {
        switch self {
        case .movies: return "Favorite Movies"
        case .music:  return "Favorite Music(Albums)"
        case .books:  return "Favorite Books"
        case .courses: return "Favorite University Courses"
        }
    }

    var emoji: String {
        switch self {
        case .movies: return "🎬"
        case .music:  return "🎵"
        case .books:  return "📚"
        case .courses: return "🏫"
        }
    }
}

struct FavoriteItem {
    let imageName: String?
    let title: String
    let subtitle: String
    let review: String
}
