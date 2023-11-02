//
//  TodoEditViewModel.swift
//  6103_Todo_MVVM
//
//  Created by ALAN CARO on 26/10/23.
//

import Foundation
import Combine

class TodoEditViewModel {
    
    // Publicador
    @Published var todoSelected: TodoEntity?
    
    // Subscriptor
    var todoSelect: AnyCancellable?
    
    init() {
        
        self.todoSelect = TodoModel.shared.$todoSelected.sink { todo in
            self.todoSelected = todo
        }
    }
    
    func editTitleTodo(title: String) {
        TodoModel.shared.editTitleTodo(title: title)
    }
    
    func editCheckedTodo(checked: Bool){
        TodoModel.shared.editCheckedTodo(checked: checked)
    }
}
