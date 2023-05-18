//  Date: 5/9/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .game
    
    var body: some View {
        VStack(spacing: 70) {
            Spacer()
            
            switch selectedTab {
            case .home:
                HomeView()
            case .leaderboard:
                LeaderboardView()
            case .game:
                GameView()
            case .profile:
                ProfileView()
            case .settings:
                SettingsView()
            }
            
            Spacer()
            
            TabBarView(selectedTab: $selectedTab)
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

