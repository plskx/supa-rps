//  Date: 5/12/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct ProfileView: View {
    @Binding var currentUser: User?
    
    var body: some View {
        VStack {
            Text(currentUser?.username ?? "No Username Found")
                .gradientTitle()
            
            HStack {
                VStack {
                    Text("Rounds")
                    Text("\(currentUser?.totalRounds ?? 0)")
                        .font(.headline)
                }
                Spacer()
                VStack {
                    Text("Wins")
                    Text("\(currentUser?.totalWins ?? 0)")
                        .font(.headline)
                }
                Spacer()
                VStack {
                    Text("Losses")
                    Text("\(currentUser?.totalLosses ?? 0)")
                        .font(.headline)
                }
            }
            .padding()
            
            Spacer()
            
            // TODO: add match history later
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
        ProfileView(currentUser: .constant(User.example))
    }
}
