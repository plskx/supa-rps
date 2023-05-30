//  Date: 5/28/23
//
//  Author: Zai Santillan
//  Github: @plskz


import Foundation

//struct Leaderboard: Codable {
//    var id: UUID?
//    var username: String
//}

struct Leaderboard {
    var users: [User]
}

extension Leaderboard {
    
    static var example: Leaderboard {
        let users = [
            User(id: UUID(), username: "chaeyoung", totalRounds: 15, totalPoints: 670, totalWins: 14, totalLosses: 1),
            User(id: UUID(), username: "jihyo", totalRounds: 20, totalPoints: 900, totalWins: 18, totalLosses: 2),
            User(id: UUID(), username: "dahyun", totalRounds: 10, totalPoints: 450, totalWins: 9, totalLosses: 1)
        ]
        return Leaderboard(users: users)
    }
    
}
