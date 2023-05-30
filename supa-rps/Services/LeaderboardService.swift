//  Date: 5/30/23
//
//  Author: Zai Santillan
//  Github: @plskz


import Foundation

func getLeaderboard() async -> Leaderboard {
    let query = client
        .database
        .from("users")
        .select()
        .gte(column: "totalpoints", value: 100)
        .order(column: "totalpoints", ascending: false)
    
    let resp: [User] = try! await query.execute().value
    let leaderboard = Leaderboard(users: resp)
    
    return leaderboard
}
