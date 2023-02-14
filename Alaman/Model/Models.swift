//
//  Models.swift
//  Alaman
//
//  Created by Amir Zhunussov on 23.01.2023.
//

import Foundation

struct Models: Codable {
    let table: [TeamsDescription]
}

struct TeamsDescription: Codable {
    let name, matches, goal, lost: String
    let draw, win: String
    var points: Int {
            return Int(win)! * 3 + Int(draw)!
        }
}
