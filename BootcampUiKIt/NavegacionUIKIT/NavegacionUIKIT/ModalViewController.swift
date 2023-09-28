//
//  ModalViewController.swift
//  NavegacionUIKIT
//
//  Created by HEBER JIMENEZ on 27/09/23.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var modalLabel: UILabel!
    
    var saludoModal = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor.red
        
        modalLabel.text = saludoModal
    }
    
    @IBAction func Regresar(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
