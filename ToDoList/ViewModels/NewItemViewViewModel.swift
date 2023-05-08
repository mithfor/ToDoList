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
    @Published var showAlert: Bool = false

    
    init() {}
    
    public func save() {
        guard canSave else { return }
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
