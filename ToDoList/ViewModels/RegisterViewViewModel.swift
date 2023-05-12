//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 05.05.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                self?.errorMessage = "\(String(describing: error?.localizedDescription))"
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(name: name,
                           email: email,
                           id: id,
                           joined: Date().timeIntervalSince1970)
        
        let database = Firestore.firestore()
        
        database.collection(AppConstants.FirebaseFirestore.collection)
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Plaese fill in your name, email and password."
            return false
        }
        
        guard email.isValidEmail() else {
            errorMessage = "Please enter valid email."
            return false
        }
        
        guard password.count >= AppConstants.minPasswordSymbolsCount else {
            errorMessage = "Password must contain at least \(AppConstants.minPasswordSymbolsCount) characters!"
            return false
        }
        
        return true
    }
}
