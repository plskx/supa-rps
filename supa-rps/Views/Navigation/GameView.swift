//  Date: 5/12/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct GameView: View {
    @Binding var currentUser: User?
    
    @State private var isShowingScore = false
    
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var computerPick: Int = Int.random(in: 0...2)
    @State private var playerPick = 0
    
    @State private var currentRound = 0
    @State private var totalWins = 0
    @State private var totalLosses = 0
    
    private let choices = ["rock", "paper", "scissor"]
    
    init(currentUser: Binding<User?>) {
        _currentUser = currentUser
        _score = State(initialValue: currentUser.wrappedValue?.totalPoints ?? 0)
        _currentRound = State(initialValue: currentUser.wrappedValue?.totalRounds ?? 0)
        _totalWins = State(initialValue: currentUser.wrappedValue?.totalWins ?? 0)
        _totalLosses = State(initialValue: currentUser.wrappedValue?.totalLosses ?? 0)
    }
    
    var body: some View {
        VStack {
            var _ = print("## GameView loaded: \(String(describing: currentUser))")
            Text("Rock Paper Scissor")
                .gradientTitle()
            
            HStack(spacing: 65) {
                Text("Round: \(currentRound)")
                    .font(.title2)
                
                Text("Score: \(score)")
                    .font(.title2)
            }
            
            Spacer()
            
            if currentRound == 0 {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(5)
            } else {
                Text("\(scoreTitle)")
                    .font(.title2.bold())
                    .padding()
                
                HStack(spacing: 35) {
                    VStack {
                        ChoiceImage(of: choices[playerPick], 128)
                        Text("You")
                            .font(.caption2)
                    }
                    VStack {
                        ChoiceImage(of: choices[computerPick], 128)
                        Text("Computer")
                            .font(.caption2)
                    }
                }
            }
            
            Spacer()
            
            HStack(spacing: 35){
                ForEach(0..<3) { number in
                    Button {
                        choiceTapped(number)
                    } label: {
                        ChoiceImage(of: choices[number], 64)
                            .padding(10)
                            .background(.ultraThinMaterial)
                            .cornerRadius(15)
                    }
                }
            }
            .padding()
            
        }
        .onAppear {
            Task {
                reloadCurrentUser()
            }
        }
        .alert("\(scoreTitle)!", isPresented: $isShowingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            if scoreTitle == "Draw" {
                Text("Nobody wins this round!\nYou earn 10 points!")
            } else if scoreTitle == "You win" {
                Text("You earn 50 points!")
            } else {
                Text("You lose 30 points!")
            }
        }
    }
    
    // functions below
    
    func reloadCurrentUser() {
        Task {
            do {
                guard let id = currentUser?.id else {
                    throw NSError()
                }
                
                if let updatedUser = await getCurrentUser(id: id) {
                    currentUser = updatedUser
                }
            } catch {
                print("Error fetching currentUser: \(error)")
            }
        }
    }
    
    
    func moveResult(_ player: Int) -> String {
        if playerPick == computerPick { return "Draw" }
        
        switch playerPick {
        case 0:
            return computerPick == 1 ? "You lose" : "You win"
        case 1:
            return computerPick == 2 ? "You lose" : "You win"
        default:
            return computerPick == 0 ? "You lose" : "You win"
        }
    }
    
    func choiceTapped(_ number: Int) {
        computerPick = Int.random(in: 0...2)
        
        playerPick = number
        scoreTitle = moveResult(playerPick)
        
        isShowingScore = true
    }
    
    func askQuestion() {
        currentRound += 1
        currentUser?.totalRounds = currentRound
        
        // draw = player gains 10 points
        // win  = player gains 50 points
        // lose = player loses 30 points
        if scoreTitle == "Draw" {
            score += 10
        } else if scoreTitle == "You win" {
            score += 50
            currentUser?.totalWins += 1
        } else {
            score -= 30
            currentUser?.totalLosses += 1
        }
        currentUser?.totalPoints = score
        
        Task {
            if let currentUser = currentUser {
                do {
                    try await updateCurrentUser(user: currentUser)
                    print("# success: updated the current user data")
                } catch {
                    print(error)
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(currentUser: .constant(User.error))
    }
}
