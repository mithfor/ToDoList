//
//  PorfileView.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 05.05.2023.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    init() {}
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading profile...")
                }
            }
            .navigationTitle(AppConstants.TabBar.Titles.profile)
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: AppConstants.TabBar.Images.profile)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 150, height: 150)
            .padding()
        
        VStack(alignment: .leading) {
            profileInfo(user: user)
        }
        
        Button("Log Out", action: {
            viewModel.logOut()
        })
    }
    
    @ViewBuilder
    func profileInfo(user: User) -> some View {
        HStack {
            Text("Name: ")
                .bold()
            Text(user.name)
        }
        .padding()
        
        HStack {
            Text("Email: ")
                .bold()
            Text(user.email)
        }
        .padding()
        
        HStack {
            Text("Member since: ")
                .bold()
            Text(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .omitted))
        }.padding()
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
