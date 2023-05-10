//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 05.05.2023.
//

import Foundation


///ViewModel for list of items view
///Primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published public var showingNewItemView = false
    
    init() {}
    
    func delete(id: String) {}
}
