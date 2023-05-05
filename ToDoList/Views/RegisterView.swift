//
//  RegisterView.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 05.05.2023.
//

import SwiftUI

struct RegisterView: View {
    
    @State var fullName = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            HeaderView(title: "Register",
                       subtitle: "Start organize todos",
                       angle: -15,
                       background: .orange)
            
            Form {
                TextField("Full Name", text: $fullName)
                    .textFieldStyle(.automatic)
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $email)
                    .textFieldStyle(.automatic)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.automatic)
                
                TLButton(title: "Create Account",
                         background: .green) {
                            //Attempt registration
                        }
            }
            .offset(y: -50)
            

            
            Spacer()
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
