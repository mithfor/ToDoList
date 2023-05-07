//
//  String+Ext.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 07.05.2023.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        guard self.contains("@") && self.contains(".") else {
            return false
        }
        
        return true
    }
}
