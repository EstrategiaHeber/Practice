//
//  TodoAddViewModel.swift
//  6103_Todo_MVVM
//
//  Created by Dragon on 09/01/23.
//

import Foundation
import Combine

class TodoAddViewModel {
    
    var sessionId: Int = Int.random(in: 1...Int.max)
    var title: String = ""
    
    // Notificador que indicara cual fue el "todo" nuevo creado (PUBLICA)
    @Published var todoAdded: TodoEntity?
    
    // Subscriptor que cachara cambios (ESCUCHA)
    var todoAddedSubscriber: AnyCancellable?
    
    init() {
        // Subscripcion
        self.todoAddedSubscriber = TodoModel.shared.$todoAdded.dropFirst().sink { (sessionId, todo) in
            
            print("Se recibió un Todo agregado de la sesión \(sessionId) [nuestra sesión es: \(self.sessionId)]")
            
            if self.sessionId == sessionId {
                print("Avisando a la vista que el todo fue agregado \(todo?.title ?? "SIN TÍTULO")")
                self.todoAdded = todo
            }
        }
    }
    
    deinit {
        self.todoAddedSubscriber?.cancel()
        self.todoAddedSubscriber = nil
    }
    
    func setTitle(title: String) {
        self.title = title
    }
    
    func addTodo() {
        self.sessionId = Int.random(in: 1...Int.max)
        print("Generando sesión \(self.sessionId)")
        TodoModel.shared.addTodo(sessionId: self.sessionId, title: self.title)
    }
}
