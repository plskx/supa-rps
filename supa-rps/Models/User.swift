//  Date: 5/28/23
//
//  Author: Zai Santillan
//  Github: @plskz


import Foundation

struct User: Identifiable, Codable {
    var id: UUID
    let username: String
    var totalRounds: Int = 0
    var totalPoints: Int = 0
    var totalWins: Int = 0
    var totalLosses: Int = 0
    
    private enum CodingKeys: String, CodingKey {
        case id
        case username
        case totalRounds = "totalrounds"
        case totalPoints = "totalpoints"
        case totalWins = "totalwins"
        case totalLosses = "totallosses"
    }
}

extension User {
    
    static var example: User {
        User(id: UUID(), username: "chaeyoung", totalRounds: 15, totalPoints: 670, totalWins: 14, totalLosses: 1)
    }
    
    static var error: User {
        User(id: UUID(), username: "no-user-found", totalRounds: 0, totalPoints: 0, totalWins: 0, totalLosses: 0)
    }
    
}
