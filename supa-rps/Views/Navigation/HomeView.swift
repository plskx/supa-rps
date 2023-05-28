//  Date: 5/12/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Welcome\nRock Paper Scissor")
                .multilineTextAlignment(.center)
                .gradientTitle()
            
            Text("To play, simply choose rock, paper, or scissors and see if you can beat the computer!")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.top, 30)
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
