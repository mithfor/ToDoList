//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 05.05.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

///ViewModel for single to do list view (each row in items list)

class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let database = Firestore.firestore()
        database.collection(AppConstants.FirebaseFirestore.collection)
            .document(uid)
            .collection(AppConstants.FirebaseFirestore.innerCollection)
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
