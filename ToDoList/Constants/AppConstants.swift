//
//  AppConstants.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 07.05.2023.
//

import Foundation

struct AppConstants {
    static let minPasswordSymbolsCount:Int = 6
    static let numberOfSecondsIn24H: Double = 86400
    
    struct Firebase {
        static let collection: String = "users"
        static let innerCollection: String = "todos"
    }
}
