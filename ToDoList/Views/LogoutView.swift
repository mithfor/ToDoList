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
            
            // Avatar
            Image(systemName: AppConstants.TabBar.Images.profile)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.blue)
                .frame(width: 150, height: 150)
            
            // Info: Name, Email, Member since
            VStack(alignment: .leading) {
                HStack {
                    Text("Name: ")
                    Text("mithfor")
                }
                HStack {
                    Text("Email: ")
                    Text("mithfor")
                }
                HStack {
                    Text("Member since: ")
                    Text(Date().formatted(date: .abbreviated, time: .omitted))
                }
            }
            
            Spacer()
                
            // Sign out
            
            TLButton(title: "Log Out",
                     background: .blue) {
                let firebaseAuth = Auth.auth()
                do {
                    try firebaseAuth.signOut()
                } catch let signOutError as NSError {
                    print("Error signing out \(signOutError)")
                }
            }
                     .padding(.bottom, 50)
            
//            Button(action: {
//                let firebaseAuth = Auth.auth()
//                do {
//                    try firebaseAuth.signOut()
//                } catch let signOutError as NSError {
//                    print("Error signing out \(signOutError)")
//                }
//            }, label: {
//                Text("Sign Out")
//            })
//            .padding(.bottom, 50)
        }
    }
}
