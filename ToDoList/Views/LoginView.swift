//
//  LoginView.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 05.05.2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List",
                           subtitle: "Get things done",
                           angle: 15,
                           background: .pink)
                
                // Login Form
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(.automatic)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(.automatic)
                    
                    TLButton(title: "Log In",
                             background: .blue) {
                                //Attempt to log in
                            }
                }
                .offset(y: -50)
                
                // Create Account
                VStack {
                    Text("New around here?")

                    NavigationLink("Create An Account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
