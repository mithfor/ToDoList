//
//  LogoutView.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 11.05.2023.
//

import SwiftUI
import FirebaseAuth

struct LogoutView: View {
    
    var body: some View {
        VStack {
            
            Button(action: {
                let firebaseAuth = Auth.auth()
                do {
                    try firebaseAuth.signOut()
                } catch let signOutError as NSError {
                    print("Error signing out \(signOutError)")
                }
            }, label: {
                Text("Sign Out")
            })
            .padding(.bottom, 50)
        }
    }
}
