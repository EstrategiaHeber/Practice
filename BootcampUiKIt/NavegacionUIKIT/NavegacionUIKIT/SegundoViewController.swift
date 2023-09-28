//
//  SegundoViewController.swift
//  NavegacionUIKIT
//
//  Created by HEBER JIMENEZ on 27/09/23.
//

import UIKit

class SegundoViewController: UIViewController {

    @IBOutlet weak var texto: UILabel!
    
    var saludo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        texto.text = saludo
    }

    @IBAction func regresar(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
