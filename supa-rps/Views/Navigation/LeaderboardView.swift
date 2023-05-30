//  Date: 5/12/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct LeaderboardView: View {
    @State var leaderboard: Leaderboard? = nil
    
    var body: some View {
        VStack {
            Text("Leaderboard")
                .gradientTitle()
            
            if let leaderboard = leaderboard {
                List(leaderboard.users) { user in
                    HStack {
                        Text(user.username)
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        VStack {
                            Text("\(user.totalPoints)")
                                .font(.headline)
                            
                            HStack {
                                Text("\(user.totalWins)")
                                    .foregroundColor(.green)
                                Text("-")
                                Text("\(user.totalLosses)")
                                    .foregroundColor(.red)
                            }
                            .font(.subheadline)
                        }
                        
                    }
                }
                .listStyle(.plain)
                .padding(.top, 20)
            } else {
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(3)
            }
            
            Spacer()
        }
        .onAppear {
            populateGetLeaderboard()
        }
        .refreshable {
            populateGetLeaderboard()
        }
    }
    
    private func populateGetLeaderboard() {
        Task {
            leaderboard = await getLeaderboard()
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(leaderboard: .example)
        //        LeaderboardView(leaderboard: nil)
    }
}
