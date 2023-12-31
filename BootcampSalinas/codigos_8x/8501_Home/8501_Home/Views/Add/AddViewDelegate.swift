//
//  AddViewDelegate.swift
//  8501_Home
//
//  Created by MacBook  on 27/01/23.
//

import Foundation
import UIKit

protocol AddViewDelegate: UIViewController {
    
    var presenter: AddPresenter? { get set }
    
    func viewWillCreate()
    
    func viewDidCreate()
    
    func viewWillRemove()
    
    func todos(todoCreated todo: TodoEntity)
    
}

extension AddViewDelegate {
    
    func viewWillCreate() {}
    
    func viewDidCreate() {}
    
    func viewWillRemove() {}
    
}
