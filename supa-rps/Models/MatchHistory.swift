//  Date: 5/28/23
//
//  Author: Zai Santillan
//  Github: @plskz


import Foundation

struct MatchHistory: Identifiable, Codable {
    var id: UUID?
    var userId: UUID
    var result: Int
    var playerMove: String
    var computerMove: String
    var timestamp: Date
}
