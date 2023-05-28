//  Date: 5/28/23
//
//  Author: Zai Santillan
//  Github: @plskz


import Foundation

struct User: Codable {
    var id: Int?
    let username: String
    let totalRounds: Int?
    let totalPoints: Int?
    let totalWins: Int?
    let totalLosses: Int?
}
