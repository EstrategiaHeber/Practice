//
//  TodoEditViewController.swift
//  6103_Todo_MVVM
//
//  Created by Dragon on 09/01/23.
//

import UIKit
import Combine

class TodoEditViewController: UIViewController {
    
    var todoEditViewModel = TodoEditViewModel()
    
    // Subscriptores
    var todoSelectSubscriber: AnyCancellable?
    var todoEditedSubscriber: AnyCancellable?
    
    var todoRecibido: TodoEntity?
    
    @IBOutlet weak var tareaTextField: UITextField!
    @IBOutlet weak var checkedSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.todoSelectSubscriber = todoEditViewModel.$todoSelected.sink {  todo in
            
            if let todo = todo {
                //self.todoRecibido = todo
                self.tareaTextField.text = todo.title
                self.checkedSwitch.isOn = todo.checked
            }
        }
    }
    
    @IBAction func saveAction(_ sender: Any) {
        print("peoeoeooeo")
        if let titulo = tareaTextField.text {
            self.todoEditViewModel.editTitleTodo(title: titulo)
        }
        
        self.todoEditViewModel.editCheckedTodo(checked: checkedSwitch.isOn)
    }
    
}
