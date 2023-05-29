//  Date: 5/9/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI
import GoTrue

struct ContentView: View {
    @State private var isLoggedIn: Bool = false;
    
    var body: some View {
        Group {
            if isLoggedIn {
                MainView(isLoggedIn: $isLoggedIn)
            } else {
                NavigationView {
                    LoginView(isLoggedIn: $isLoggedIn)
                        .padding()
                }
            }
        }
        .task {
            await getCurrentSession()
        }
    }
    
    private func getCurrentSession() async {
        do {
            let session = try await client.auth.session
            if !session.accessToken.isEmpty {
                // Session exists, user is logged in
                isLoggedIn = true
            }
        } catch {
            print("Error fetching session: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

