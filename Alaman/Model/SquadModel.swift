//
//  TeamModel.swift
//  Alaman
//
//  Created by Amir Zhunussov on 11.02.2023.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let squad: [Squad]
}

// MARK: - Squad
struct Squad: Codable {
    let teamName: String
    let players: [Player]

    enum CodingKeys: String, CodingKey {
        case teamName = "team_name"
        case players
    }
}

// MARK: - Player
struct Player: Codable {
    let name: String
    let position: Position
}

enum Position: String, Codable {
    case defender = "Defender"
    case forward = "Forward"
    case goalkeeper = "Goalkeeper"
    case midfielder = "Midfielder"
}
