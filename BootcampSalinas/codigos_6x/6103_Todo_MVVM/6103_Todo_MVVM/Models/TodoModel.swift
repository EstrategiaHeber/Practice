//
//  TodoModel.swift
//  6103_Todo_MVVM
//
//  Created by Dragon on 09/01/23.
//

import Foundation
import CoreData
import Combine

class TodoModel {
    
    // Singleton
    static let shared = TodoModel()
    
    // NOTIFICADORES
    
    /// Son los `todos` para los *vista-modelos*
    @Published var todos: [TodoEntity] = []
    
    /// "todo" que sera agregado o creado
    @Published var todoAdded: (sessionId: Int, todo: TodoEntity?) = (0, nil)
    
    /// "todo" seleccionado
    @Published var todoSelected: TodoEntity?
    
    // Creacion de BD
    var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TodoApp")
        
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("No se pudo cargar el contenedor TodoApp")
            }
        }
        
        return container
    }()
    
    // Recuperacion de todos los elementos existentes en la tabla deseada desde CoreData
    func loadTodos() {
        
        let context = self.container.viewContext
        let request = TodoEntity.fetchRequest()
        
        if let todos = try? context.fetch(request) {
            self.todos = todos
        }
    }
    
    // Crear nuevo "todo" y guardarla en CoreData
    func addTodo(sessionId: Int, title: String) {
        print("Agregando Todo para la sesión: \(sessionId)")
        
//        let context = self.container.viewContext
//        
//        let todo = TodoEntity(context: context)
//        
//        todo.title = title
//        todo.checked = true
//        
//        do {
//            // Se guarda el todo en CoreData
//            try context.save()
//            
//            // Se cargan los elementos existentes en CoreData
//            self.loadTodos()
//            print("Todo agregado con la sesión: \(sessionId)")
//            
//            // Se notifica quien fue el "todo" creado-agregado
//            self.todoAdded = (sessionId, todo)
//            
//        } catch {
//            context.rollback()
//            print("Error al agregar el Todo con la sesión \(sessionId)")
//            self.todoAdded = (sessionId, nil)
//        }
    }
    
    // Seleccionar un "todo"
    func selectTodo(index: Int) {
        self.todoSelected = todos[index]
    }
    
    func editTitleTodo(title: String) {
        print("EL titulo es: \(title)")
        if let todoEditado = self.todoSelected {
            
            todoEditado.title = title
            
            let context = self.container.viewContext
            
            do {
                try context.save()
                self.loadTodos()
            } catch {
                context.rollback()
            }
        }
    }
    
    func editCheckedTodo(checked: Bool) {
        
        let context = self.container.viewContext
        
        let todo = TodoEntity(context: context)
        
        todo.checked = checked
        
        do {
            try context.save()
            self.loadTodos()
        } catch {
            context.rollback()
        }
    }
    
    // TODO: **PENDIENTE**
    func deleteTodo() {
        
        //if let todo = self.getTodo(index: index) {
            
            let context = self.container.viewContext
        let requestEmpleado = TodoEntity.fetchRequest()
        
        if let empleados = try? context.fetch(requestEmpleado){
            
            for i in empleados {
                context.delete(i)
                do {
                    try context.save()
                    self.loadTodos()
                } catch {
                    context.rollback()
                }
            }
        }
        
            
//            do {
//                try context.save()
//                self.loadTodos()
//            } catch {
//                context.rollback()
//            }
        //}
        
    }
}
