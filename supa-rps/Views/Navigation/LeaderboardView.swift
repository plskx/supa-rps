//  Date: 5/12/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct LeaderboardView: View {
    
    var body: some View {
        VStack {
            Text("Leaderboard")
                .gradientTitle()
            
//            List(users) { user in
//                HStack {
//                    Text(user.username)
//                        .font(.headline)
//                        .foregroundColor(.primary)
//                    
//                    Spacer()
//                    
//                    VStack(alignment: .trailing) {
//                        Text("\(user.totalWins) - \(user.totalLosses)")
//                            .font(.subheadline)
//                            .foregroundColor(.secondary)
//                        
//                        Text("Last match: \(user.lastMatchTime)")
//                            .font(.caption)
//                            .foregroundColor(.secondary)
//                    }
//                }
//            }
//            .listStyle(.plain)
//            .padding(.top, 20)
            
            Spacer()
        }
    }
    
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
