//  Date: 5/28/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct SignUpAccountView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginFormError = LoginFormError()
    
    var body: some View {
        VStack {
            Text("Register")
                .gradientTitle()
            
            VStack(spacing: 20) {
                TextField("Username", text: $username)
                    .styledField()
                    .disableAutoCapsAndCorrection()
                
                if !loginFormError.username.isEmpty {
                    Text(loginFormError.username)
                        .foregroundColor(.red)
                        .padding(-15)
                }
                
                TextField("Email", text: $email)
                    .styledField()
                    .disableAutoCapsAndCorrection()
                    .padding(.top, -5)
                
                if !loginFormError.email.isEmpty {
                    Text(loginFormError.email)
                        .foregroundColor(.red)
                        .padding(-15)
                }
                
                SecureField("Password", text: $password)
                    .styledField()
                
                if !loginFormError.password.isEmpty {
                    Text(loginFormError.password)
                        .foregroundColor(.red)
                        .padding(-15)
                }
            }
            
            Button("Register") {
                if isFormValid {
                    print("Register form is valid!")
                } else {
                    print("Register form not valid")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        clearForm()
                    }
                }
            }
            .styledButton()
            .padding(.top, 10)
        }
        .padding()
    }
    
    // MARK: funcs below
    
    private func clearForm() {
        loginFormError = LoginFormError()
    }
    
    private func isValidUsername(_ username: String) -> Bool {
        // Username should:
        // - contain at least 3 characters
        // - no spaces
        // - no '@' symbol
        return username.count >= 3 && !username.contains(" ") && !username.contains("@")
    }
    
    private var isFormValid: Bool {
        clearForm()
        
        if username.isEmpty {
            loginFormError.username = "Username is required."
        } else if !isValidUsername(username) {
            loginFormError.username = "Invalid username."
        }
        
        if email.isEmpty {
            loginFormError.email = "Email is required."
        } else if !email.isValidEmail {
            loginFormError.email = "Email is not in the correct format."
        }
        
        if password.isEmpty {
            loginFormError.password = "Password is required."
        }
        
        return loginFormError.username.isEmpty && loginFormError.email.isEmpty && loginFormError.password.isEmpty
    }
    
    // --- end LoginView ---
}

struct SignUpAccountView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpAccountView()
            .padding()
    }
}
