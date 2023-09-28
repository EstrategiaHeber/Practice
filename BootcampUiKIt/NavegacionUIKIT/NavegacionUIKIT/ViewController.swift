//
//  ViewController.swift
//  NavegacionUIKIT
//
//  Created by HEBER JIMENEZ on 27/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    let hola = "Hola, ¿Como estas?"
    let modal = "Hola yo soy VistaModal"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // ** FUNCION PARA ENVIAR UN PARAMETRO A OTRA PANTALLA, POR MEDIO DE SEGUE.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Validación de la existencia del "segue" con el identificador "enviar"
        if segue.identifier == "enviar" {
            
            // Validación de la existencia del destino
            if let destino = segue.destination as? SegundoViewController {
                destino.saludo = hola
            }
        } else if segue.identifier == "showModalView" {
            // Validación de la existencia del destino
            if let destinoModal = segue.destination as? ModalViewController {
                destinoModal.saludoModal = modal
            }
        }
    }
    
    // ** FUNCION PARA REGRESAR A INICIO DESDE CUALQUIER PANTALLA EN LA QUE ESTEMOS
    @IBAction func regresarInicio (segue: UIStoryboardSegue) {
        print("Regresar a inicio")
    }
}

