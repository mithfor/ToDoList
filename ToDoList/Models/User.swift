//
//  User.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 05.05.2023.
//

import Foundation

struct User: Codable {
    let name: String
    let email: String
    let id: String
    let joined: TimeInterval
}
