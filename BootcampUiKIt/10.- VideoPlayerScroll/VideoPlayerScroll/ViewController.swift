//
//  ViewController.swift
//  VideoPlayerScroll
//
//  Created by HEBER JIMENEZ on 17/10/23.
//

import UIKit

class ViewController: UIViewController, VideoManagerProtocol {
    
    @IBOutlet weak var categoriasVideos: UISegmentedControl!
    @IBOutlet weak var videosCollection: UICollectionView!
    
    // Instancia del manager
    var manager = VideoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegado = self
        
        Task {
            await manager.encontrarVideos(categoria: "futbol")
        }
    }
    
    // Metodo que se debe implementar obligatoriamente por medio del delegado
    func mostrarVideos(listaVideos: [Video]) {
        print(listaVideos)
    }
    
    @IBAction func buscarButton(_ sender: Any) {
    }
    
    // Metodo que detectara cada que se seleccione alguna categoria
    @IBAction func categoriaSeleccionada(_ sender: UISegmentedControl) {
    }
    
}

