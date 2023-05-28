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
    @State private var errorDescription = ""
    
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
                
                if !errorDescription.isEmpty {
                    Text(errorDescription)
                        .foregroundColor(.red)
                        .padding(-15)
                }
            }
            
            VStack(spacing: 15) {
                Button("Login") {
                    if isFormValid {
                        print("Login form is valid!")
                        login() // supabase login
                    } else {
                        print("Login form not valid")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            clearForm()
                        }
                    }
                }
                .styledButton()
                
                HStack {
                    NavigationLink(destination: RegisterView()) {
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
    
    private func login() {
        Task {
            do {
                try await client.auth.signIn(email: email, password: password)
                self.isLoggedIn = true;
                print("Successful logged in!")
            } catch {
                print("Error signing in: \(error)")
                errorDescription = error.localizedDescription
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    errorDescription = ""
                    password = ""
                }
            }
        }
    }
    // --- end LoginView ---
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoggedIn: .constant(false))
            .padding()
    }
}

