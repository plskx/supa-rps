//  Date: 5/11/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct GradientTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(
                LinearGradient(
                    colors: [
                        Color(red: 0.6, green: 0.8, blue: 0.4),
                        Color(red: 0.4, green: 0.6, blue: 0.3),
                        Color(red: 0.2, green: 0.4, blue: 0.2),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .padding(.bottom)
    }
}

extension View {
    func gradientTitle() -> some View {
        self.modifier(GradientTitle())
    }
}

struct GradientTitleModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello world")
            .gradientTitle()
    }
}
