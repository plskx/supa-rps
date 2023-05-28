//  Date: 5/28/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginFormError = LoginFormError()
    
    var body: some View {
        VStack {
            Text("SupaRPS")
                .gradientTitle()
            
            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .styledField()
                    .disableAutoCapsAndCorrection()
                
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
            
            VStack(spacing: 15) {
                Button("Login") {
                    if isFormValid {
                        print("Login form is valid!")
                        isLoggedIn = true // temporary logged in the user when form is valid.
                        #warning("add supabase")
                    } else {
                        print("Login form not valid")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            clearForm()
                        }
                    }
                }
                .styledButton()
                
                HStack {
                    NavigationLink(destination: SignUpAccountView()) {
                        Text("Need an account?")
                            .foregroundColor(.black)
                        Text("Sign up!")
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(.top, 10)
        }
    }
    
    // MARK: funcs below
    
    private func clearForm() {
        loginFormError = LoginFormError()
    }
    
    private var isFormValid: Bool {
        clearForm()
        
        if email.isEmpty {
            loginFormError.email = "Email is required."
        } else if !email.isValidEmail {
            loginFormError.email = "Email is not in correct format."
        }
        
        if password.isEmpty {
            loginFormError.password = "Password is required."
        }
        
        return loginFormError.email.isEmpty && loginFormError.password.isEmpty
    }
    
    // --- end LoginView ---
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoggedIn: .constant(false))
            .padding()
    }
}

