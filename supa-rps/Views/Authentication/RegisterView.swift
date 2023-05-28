//  Date: 5/28/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI
import GoTrue

struct RegisterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var loginFormError = LoginFormError()
    @State private var alertDescription = ""
    @State private var successful: Bool = false
    
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
                
                if !alertDescription.isEmpty {
                    Text(alertDescription)
                        .foregroundColor(!successful ? .red : .green)
                        .font(.title2)
                        .padding(-15)
                }
            }
            
            Button("Register") {
                if isFormValid {
                    print("Register form is valid!")
                    register()
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
        alertDescription = ""
    }
    
    private var isFormValid: Bool {
        clearForm()
        
        if username.isEmpty {
            loginFormError.username = "Username is required."
        } else if !username.isValidUsername {
            // Username should:
            // - contain at least 3 characters
            // - no spaces
            // - no '@' symbol
            loginFormError.username = "Invalid username."
        }
        
        if email.isEmpty {
            loginFormError.email = "Email is required."
        } else if !email.isValidEmail {
            loginFormError.email = "Email is not in the correct format."
        }
        
        if password.isEmpty {
            loginFormError.password = "Password is required."
        } else if !password.isValidPassword {
            loginFormError.password = "Password must be 6 or more characters."
        }
        
        return loginFormError.username.isEmpty && loginFormError.email.isEmpty && loginFormError.password.isEmpty
    }
    
    private func register() {
        Task {
            do {
                let registerAuthResponse = try await client.auth.signUp(
                    email: email,
                    password: password,
                    data: [
                        "username": AnyJSON.string(username)
                    ]
                )
                
                if let session = registerAuthResponse.session {
                    // Registration successful, process the session
                    print("session: \(session)")
                    successful = true
                    alertDescription = "Successful register! now try to login!"
                    username = ""
                    email = ""
                    password = ""
                } else {
                    // No session when registering user
                    print("No session when registering the user")
                    throw RegistrationError.noSession
                }
                
            } catch {
                print("Error registering: \(error)")
                alertDescription = error.localizedDescription
                
                // Clear form fields and error message after a delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    alertDescription = ""
                    username = ""
                    password = ""
                }
            }
        }
    }
    
    // --- end RegisterView ---
}

struct SignUpAccountView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .padding()
    }
}
