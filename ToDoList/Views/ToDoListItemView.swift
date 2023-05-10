//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Dmitrii Voronin on 05.05.2023.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    let item: ToDoListItem
    
//    init() {}
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
        
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }

        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id: "123", title: "Get some", dueDate: Date.timeIntervalBetween1970AndReferenceDate, createDate: Date.timeIntervalBetween1970AndReferenceDate, isDone: false))
    }
}
