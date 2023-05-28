//  Date: 5/9/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn: Bool = false;
    @State private var email = ""
    var body: some View {
        if isLoggedIn {
            AppMainView()
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

