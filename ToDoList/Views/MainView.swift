//
//  ContentView.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 04.05.2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label(AppConstants.TabBar.Titles.home,
                          systemImage: AppConstants.TabBar.Images.home)
                }
            ProfileView()
                .tabItem {
                    Label(AppConstants.TabBar.Titles.profile, systemImage: AppConstants.TabBar.Images.profile)
                    
                }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
