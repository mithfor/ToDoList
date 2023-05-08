//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 05.05.2023.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var dueDate: Date = Date()
    
    init() {}
    
    public func save() {}
}
