//  Date: 5/12/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct User: Identifiable {
    let id = UUID()
    let username: String
    var totalWins: Int
    var totalLosses: Int
    var lastMatchTime: String
}

struct LeaderboardView: View {
    let users = [
        User(username: "John", totalWins: 10, totalLosses: 2, lastMatchTime: "2 minutes ago"),
        User(username: "Jane", totalWins: 8, totalLosses: 4, lastMatchTime: "1 hour ago"),
        User(username: "Bob", totalWins: 6, totalLosses: 6, lastMatchTime: "1 day ago"),
        User(username: "Alice", totalWins: 4, totalLosses: 8, lastMatchTime: "2 days ago"),
        User(username: "Tom", totalWins: 2, totalLosses: 10, lastMatchTime: "5 days ago")
    ]
    
    var body: some View {
        VStack {
            Text("Leaderboard")
                .gradientTitle()
            
            List(users) { user in
                HStack {
                    Text(user.username)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("\(user.totalWins) - \(user.totalLosses)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("Last match: \(user.lastMatchTime)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .listStyle(.plain)
            .padding(.top, 20)
            
            Spacer()
        }
    }
    
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
