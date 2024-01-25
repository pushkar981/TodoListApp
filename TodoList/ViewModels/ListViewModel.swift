//
//  ListViewModel.swift
//  TodoList
//
//  Created by ronik on 1/23/24.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        let newItems = [
            ItemModel(title: "First item", isCompleted: true),
            ItemModel(title: "Second item", isCompleted: false),
            ItemModel(title: "Third item", isCompleted: true),
            ItemModel(title: "Fourth item", isCompleted: false)
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(fromIndex: IndexSet, toIndex: Int) {
        items.move(fromOffsets: fromIndex, toOffset: toIndex)
    }
    
    func addItem(title: String) {
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.toggleCompletion()
        }
    }
}
