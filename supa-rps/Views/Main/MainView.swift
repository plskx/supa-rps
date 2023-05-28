//  Date: 5/28/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct MainView: View {
    @Binding var isLoggedIn: Bool
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
                SettingsView(isLoggedIn: $isLoggedIn)
            }
            
            Spacer()
            
            TabBarView(selectedTab: $selectedTab)
        }
        .padding(.horizontal)
    }
}

struct AppMainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(isLoggedIn: .constant(true))
    }
}
