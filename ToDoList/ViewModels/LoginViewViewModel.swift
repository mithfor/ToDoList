//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 05.05.2023.
//

import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    init() {}
}
