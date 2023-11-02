//
//  ResultadoViewController.swift
//  CalculadoraIMC
//
//  Created by HEBER JIMENEZ on 29/09/23.
//

import UIKit

class ResultadoViewController: UIViewController {
    
    /// Propiedades u objetos que se van a recibir de otra vista, por medio del segue
    
    // Este es el objeto
    var recibirResultadoIMC : ModelIMC?
    // Y estas son sus propiedades del objeto desglozadas
    var recibirValorIMC : String?
    var recibirMensaje : String?
    var recibirColor : UIColor?
    var recibirImagen : UIImage?
    
    @IBOutlet weak var resultadoIMCLabel: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var mensajeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ocultar el boton de regresar
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        // Si se recibe el objeto completo
        resultadoIMCLabel.text = String(format: "%.1f", recibirResultadoIMC?.valor ?? 0.0)
        imagen.image = recibirResultadoIMC?.image
        mensajeLabel.text = recibirResultadoIMC?.aviso
        self.view.backgroundColor = recibirResultadoIMC?.color
        
        // Si se reciben sus propiedades desglozadas
        //resultadoIMCLabel.text = recibirValorIMC
        //imagen.image = recibirImagen
        //mensajeLabel.text = recibirMensaje
        //self.view.backgroundColor = recibirColor
    }
    
    // Boton para regresar a la vista anterior
    @IBAction func regresarButton(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
}
