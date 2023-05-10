//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 05.05.2023.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    // TODO: - Description
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
