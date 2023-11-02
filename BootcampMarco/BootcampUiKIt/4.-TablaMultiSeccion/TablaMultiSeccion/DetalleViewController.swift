//
//  DetalleViewController.swift
//  TablaMultiSeccion
//
//  Created by HEBER JIMENEZ on 03/10/23.
//

import UIKit

class DetalleViewController: UIViewController {
    
    // Propiedades que alojaran informacion del otro ViewController por medio del segue
    
    var recibirEquipo: EquipoModel?
    var recibirAlumno: AlumnoModel?

    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var titulosGanadosLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.nombreLabel.text = recibirEquipo?.nombre ?? "Sin nombre"
        self.titulosGanadosLabel.text = "Titulos: \(recibirEquipo?.titulosGanados ?? 0)"
        self.imagen.image = recibirEquipo?.logo ?? UIImage(systemName: "person")
    }
}
