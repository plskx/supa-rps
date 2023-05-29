//  Date: 5/28/23
//
//  Author: Zai Santillan
//  Github: @plskz


import Foundation

struct Leaderboard: Codable {
    var id: UUID?
    var userId: UUID
    var lastMatch: Date
    var result: Int
    var playerMove: String
    var computerMove: String
}
