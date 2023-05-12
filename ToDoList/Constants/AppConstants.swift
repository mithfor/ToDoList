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
    
    struct FirebaseFirestore {
        static let collection: String = "users"
        static let innerCollection: String = "todos"
    }
    
    struct TabBar {
        struct Titles {
            static let home: String = "Home"
            static let profile: String = "Profile"
        }
        
        struct Images {
            static let home: String = "house"
            static let profile: String = "person.circle"       }
    }
    
    struct ButtonImage {
        static let ToDoIsDone = "checkmark.circle.fill"
        static let ToDoIsNotDone = "circle"
    }
}
