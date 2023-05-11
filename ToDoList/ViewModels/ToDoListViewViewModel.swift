//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 05.05.2023.
//

import FirebaseFirestore
import Foundation


///ViewModel for list of items view
///Primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published public var showingNewItemView = false
    
    private let userId: String
    
    init(userId : String) {
        self.userId = userId
    }
    
    /// Delete to do list item from listview and firestore database
    /// - Parameter id: item id to delete
    func delete(id: String) {
        let database = Firestore.firestore()
        
        database.collection(AppConstants.Firebase.collection)
            .document(userId)
            .collection(AppConstants.Firebase.innerCollection)
            .document(id)
            .delete()
    }
}
