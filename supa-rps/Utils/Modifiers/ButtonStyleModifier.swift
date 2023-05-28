//  Date: 5/28/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: 200)
            .background(Color.blue)
            .cornerRadius(30)
    }
}

extension Button {
    func styledButton() -> some View {
        self.modifier(ButtonStyle())
    }
}

struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Register") {
            // logic
        }
        .styledButton()
        .padding()
    }
}
