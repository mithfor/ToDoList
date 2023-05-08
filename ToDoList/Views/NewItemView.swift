//
//  NewItemView.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 05.05.2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
        
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding()
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(.plain)
                
                TextField("Description", text: $viewModel.description)
                    .textFieldStyle(.plain)
                
                // Due Date
                DatePicker("Due Date",
                           selection: $viewModel.dueDate,
                           displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(.graphical)
                
                // Button
                
                TLButton(title: "Save",
                         background: .pink) {
                    viewModel.save()
                    newItemPresented = false
                }
                         .padding()
            }

        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
        
    }
}
