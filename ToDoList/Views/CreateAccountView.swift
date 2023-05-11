//
//  CreateAccountView.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 11.05.2023.
//

import SwiftUI

struct CreateAccountView: View {
    
    var body: some View {
        VStack {
            Text("New around here?")
            
            NavigationLink("Create An Account",
                           destination: RegisterView())
        }
        .padding(.bottom, 50)
    }
}
