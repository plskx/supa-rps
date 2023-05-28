//
//  TabBarView1.swift
//  CustomTabBar
//
//  Created by Pratik on 14/10/22.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.white)
                .shadow(color: .gray.opacity(0.4), radius: 20, x: 0, y: 20)
            
            TabsLayoutView(selectedTab: $selectedTab)
        }
        .frame(height: 70, alignment: .center)
    }
}

fileprivate struct TabsLayoutView: View {
    @Binding var selectedTab: Tab
    @Namespace var namespace
    
    var body: some View {
        HStack {
            Spacer(minLength: 0)
            
            ForEach(Tab.allCases) { tab in
                TabButton(tab: tab, selectedTab: $selectedTab, namespace: namespace)
                    .frame(width: 65, height: 65, alignment: .center)
                
                Spacer(minLength: 0)
            }
        }
    }
    
    private struct TabButton: View {
        let tab: Tab
        @Binding var selectedTab: Tab
        var namespace: Namespace.ID
        
        var body: some View {
            Button {
                withAnimation {
                    selectedTab = tab
                }
            } label: {
                ZStack {
                    if isSelected {
                        Circle()
                            .shadow(radius: 10)
                            .background {
                                Circle()
                                    .stroke(lineWidth: 15)
                                    .foregroundColor(Color.init(white: 0.92))
                            }
                            .offset(y: -40)
                            .matchedGeometryEffect(id: "Selected Tab", in: namespace)
                            .animation(.spring(), value: selectedTab)
                    }
                    
                    Image(systemName: tab.icon)
                        .font(.system(size: 23, weight: .semibold, design: .rounded))
                        .foregroundColor(isSelected ? .init(white: 0.9) : .gray)
                        .scaleEffect(isSelected ? 1 : 0.8)
                        .offset(y: isSelected ? -40 : 0)
                        .animation(isSelected ? .spring(response: 0.5, dampingFraction: 0.3, blendDuration: 1) : .spring(), value: selectedTab)
                }
            }
            .buttonStyle(.plain)
        }
        
        private var isSelected: Bool {
            selectedTab == tab
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: .constant(.game))
            .previewLayout(.fixed(width: 375, height: 70))
            .padding()
    }
}

enum Tab: Int, Identifiable, CaseIterable, Comparable {
    static func < (lhs: Tab, rhs: Tab) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case home, leaderboard, game, profile, settings
    
    internal var id: Int { rawValue }
    
    var icon: String {
        switch self {
        case .home:
            return "house.fill"
        case .leaderboard:
            return "list.number"
        case .game:
            return "gamecontroller.fill"
        case .profile:
            return "person.fill"
        case .settings:
            return "gearshape.fill"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .leaderboard:
            return "Leaderboard"
        case .game:
            return "Games"
        case .profile:
            return "Profile"
        case .settings:
            return "Settings"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return .indigo
        case .leaderboard:
            return .green
        case .game:
            return .pink
        case .profile:
            return .orange
        case .settings:
            return .purple
        }
    }
}
