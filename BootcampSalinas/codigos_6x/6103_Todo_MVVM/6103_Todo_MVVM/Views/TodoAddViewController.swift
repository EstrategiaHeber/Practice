//
//  TodoAddViewController.swift
//  6103_Todo_MVVM
//
//  Created by Dragon on 09/01/23.
//

import UIKit
import Combine

class TodoAddViewController: UIViewController {
    
    // Instancia del ViewModel
    var addViewModel = TodoAddViewModel()
    
    @IBOutlet weak var titleTextField: UITextField!
    
    // Subscriptor para escuchar actualizaciones
    var todoAddedSubscriber: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad Existente")
        
        // Se crea subscripcion para estar atento a cuando ocurra un cambio, poder actualizar la vista
        self.todoAddedSubscriber = self.addViewModel.$todoAdded.dropFirst().sink(receiveValue: { todoEscuchado in
            
            if let todo = todoEscuchado {
                print("TODO AGREGADO: \(todo)")
                self.navigationController?.popViewController(animated: true)
            }
            
        })
    }
    
    // Accion relacionada con el textField que detectara cambios al escribir
    @IBAction func changeTitleAction() {
        if let title = self.titleTextField.text {
            print("Ajustando título: \(title)")
            self.addViewModel.setTitle(title: title)
        }
    }
    
    // Guarda el nuevo "todo"
    @IBAction func addTodoAction() {
        self.addViewModel.addTodo()
    }

}
