//  Date: 5/12/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct Match: Hashable {
    let userMove: String
    let computerMove: String
    let winner: String
}

let match1 = Match(userMove: "Rock", computerMove: "Paper", winner: "Computer")
let match2 = Match(userMove: "Scissors", computerMove: "Scissors", winner: "Tie")
let match3 = Match(userMove: "Paper", computerMove: "Scissors", winner: "Computer")
let matchHistory = [match1, match2, match3]

struct ProfileView: View {
    let username: String = "JohnDoe"
    let currentRound: Int = 5
    let totalWins: Int = 3
    let totalLosses: Int = 2
    let history = matchHistory
    
    var body: some View {
        VStack {
            Text(username)
                .font(.title)
                .padding()
            
            HStack {
                VStack {
                    Text("Rounds")
                    Text("\(currentRound)")
                        .font(.headline)
                }
                Spacer()
                VStack {
                    Text("Wins")
                    Text("\(totalWins)")
                        .font(.headline)
                }
                Spacer()
                VStack {
                    Text("Losses")
                    Text("\(totalLosses)")
                        .font(.headline)
                }
            }
            .padding()
            
            //            Text("Match History")
            //                .font(.title.bold())
            //                .padding()
            //
            //            VStack {
            //                ForEach(matchHistory, id: \.self) { match in
            //                    HStack(spacing: 70) {
            //                        VStack {
            //                            Text("User")
            //                                .font(.title2.bold())
            //                            ChoiceImage(of: "rock", 36)
            //                        }
            //
            //                        Text("vs")
            //                            .font(.title2.bold())
            //                        VStack {
            //                            Text("Computer")
            //                                .font(.title2.bold())
            //                            ChoiceImage(of: "paper", 36)
            //                        }
            //                    }
            //                }
            //            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
