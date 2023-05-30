//  Date: 5/9/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI
import GoTrue

struct ContentView: View {
    @State private var isLoggedIn: Bool = false
    @State private var currentUser: User? = nil
    
    var body: some View {
        Group {
            if isLoggedIn {
                MainView(isLoggedIn: $isLoggedIn, currentUser: $currentUser)
            } else {
                NavigationView {
                    LoginView(isLoggedIn: $isLoggedIn, currentUser: $currentUser)
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
                
                let currentUser = await getCurrentUser(id: session.user.id)
                self.currentUser = currentUser!
                
                isLoggedIn = true
            } else {
                // Session doesn't exist, user is logged out
                self.currentUser = nil
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

