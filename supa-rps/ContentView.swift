//  Date: 5/9/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI
import GoTrue

struct ContentView: View {
    @State private var isLoggedIn: Bool = false;
    
    var body: some View {
        if isLoggedIn {
            MainView(isLoggedIn: $isLoggedIn)
        } else {
            NavigationView {
                LoginView(isLoggedIn: $isLoggedIn)
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

