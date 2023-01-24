//
//  Models.swift
//  Alaman
//
//  Created by Amir Zhunussov on 23.01.2023.
//

import Foundation

struct Models: Codable {
    let table: [teamsDescription]
}

struct teamsDescription: Codable {
    let name: String
    let win: String
    let draw: String
    let lost: String
    let goal: String
    let matches: String
    let points: String
}
