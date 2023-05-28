//  Date: 5/28/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct FieldStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

extension TextField {
    func styledField() -> some View {
        self.modifier(FieldStyleModifier())
    }
}

extension SecureField {
    func styledField() -> some View {
        self.modifier(FieldStyleModifier())
    }
}

struct FieldStyleModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            TextField("Email", text: .constant("a@gmail.com"))
                .styledField()
            
            SecureField("Password", text: .constant("password"))
                .styledField()
            
        }
        .padding()
    }
}

