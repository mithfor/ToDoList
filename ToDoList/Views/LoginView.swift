//
//  LoginView.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 05.05.2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    @StateObject private var keyboardHandler = KeyboardHandler()
    
    var body: some View {
        NavigationView {
//            ScrollView(.vertical) {
                
                VStack {
                    // Header
                    HeaderView(title: "To Do List",
                               subtitle: "Get things done",
                               angle: 15,
                               background: .pink)
                    
                    Form {
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundColor(.red)
                                .font(.system(size: 16))
                        }
                        
                        TextField("Email Address", text: $viewModel.email)
                            .textFieldStyle(.automatic)
                            .autocorrectionDisabled()
                        
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(.automatic)
                        
                        TLButton(title: "Log In",
                                 background: .blue) {
                            viewModel.login()
                        }

                    }
                    .offset(y: -100)
                    .frame(width: UIScreen.main.bounds.width,
                           height: 200)
                    
                    // Create Account
                    CreateAccountView()
                    
                    Spacer()
                }

                
//            }
                .offset(y: -keyboardHandler.keyboardHeight / 2)
            .animation(.default, value: keyboardHandler.keyboardHeight)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
