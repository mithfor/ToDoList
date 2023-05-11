//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 05.05.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false

    
    init() {}
    
    public func save() {
        guard canSave else {
            return
        }
        
       // Get curent userID
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create a model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        // Save model
        let database = Firestore.firestore()
        database.collection(AppConstants.Firebase.collection)
            .document(userId)
            .collection(AppConstants.Firebase.innerCollection)
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-(AppConstants.numberOfSecondsIn24H)) else {
            return false
        }
        
        return true
    }
}
