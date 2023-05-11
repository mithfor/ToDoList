//
//  TLButton.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 05.05.2023.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void

    var body: some View {
        
        Button {
            // Action
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()
        .frame(height: 80)
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Title", background: .blue) {
            // Action
        }
    }
}
