//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 05.05.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

///ViewModel for profile view
///Secondary tab
class ProfileViewViewModel: ObservableObject {
    
    init() {}
    
    @Published var user: User? = nil
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let database = Firestore.firestore()
        
        database.collection(AppConstants.FirebaseFirestore.collection)
            .document(userId).getDocument { [weak self] snapshot, error in
                guard let data = snapshot?.data(),
                error == nil
                else { return }
                
                DispatchQueue.main.async {
                    self?.user = User(name: data["name"] as? String ?? "",
                                      email: data["email"] as? String ?? "",
                                      id: data["id"] as? String ?? "",
                                      joined: data["joined"] as? TimeInterval ?? 0)
                }
            }
    }
    
    func logOut() {

        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out \(signOutError)")
        }
    }
}
