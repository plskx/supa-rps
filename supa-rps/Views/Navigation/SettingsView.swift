//  Date: 5/12/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct SettingsView: View {
    @Binding var isLoggedIn: Bool
    @Binding var currentUser: User?
    
    var body: some View {
        
        VStack {
            Text("Settings View")
                .gradientTitle()
            
            Spacer()
            
            Button("Logout") {
                logout()
            }
            .styledButton()
            
            Spacer()
        }
    }
    
    // MARK: funcs below
    
    private func logout() {
        Task {
            do {
                try await client.auth.signOut()
                self.isLoggedIn = false
                self.currentUser = nil
                print("Successful logout!")
            }
            catch {
                print("Error signing out: \(error)")
            }
        }
    }
    
    // --- end SettingsView ---
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isLoggedIn: .constant(true), currentUser: .constant(User.example))
    }
}
