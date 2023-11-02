//
//  TodoEditViewModel.swift
//  6103_Todo_MVVM
//
//  Created by HEBER JIMENEZ on 26/10/23.
//

import Foundation
import Combine

class TodoDetailViewModel {
    
    // Publicador
    @Published var todoSelected: TodoEntity?
    
    // Subscriptor
    var todoSelectSubscriber: AnyCancellable?
    
    init() {
        // Subscripcion
        self.todoSelectSubscriber = TodoModel.shared.$todoSelected.dropFirst().sink {  todo in
            print("El todo seleccionado es: \(todo)")
            
            self.todoSelected = todo
        }
    }
    
    deinit {
        print("Desinicializar")
        self.todoSelectSubscriber?.cancel()
        self.todoSelectSubscriber = nil
    }
}
