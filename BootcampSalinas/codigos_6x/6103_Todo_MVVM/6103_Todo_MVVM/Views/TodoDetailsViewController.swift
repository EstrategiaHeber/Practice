//
//  TodoDetailsViewController.swift
//  6103_Todo_MVVM
//
//  Created by Dragon on 09/01/23.
//

import UIKit
import Combine

class TodoDetailsViewController: UIViewController {
    
    var detailViewModel = TodoDetailViewModel()
    
    // Subscriptor para escuchar actualizaciones
    var todoSelectSubscriber: AnyCancellable?
    
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var checkedLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.todoSelectSubscriber = detailViewModel.$todoSelected.sink {  todo in
            
            if let todo = todo {
                self.nombreLabel.text = todo.title
                self.checkedLabel.text = todo.checked ? "✅" : "❌"
//                self.createdLabel.text = todo.toString()
//                self.updatedLabel.text = todo.updateAt?.toString()
            }
        }
    }
}
