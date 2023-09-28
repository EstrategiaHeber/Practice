//
//  ViewController.swift
//  Marimba
//
//  Created by ALAN CARO on 25/09/23.
//


import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    /// Creación de reproductor, encargado de reproducir todos los tonos musicales
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reproducirNota(_ sender: UIButton) {
        
        /// Imprime todas las propiedades del boton, para saber cual
        /// boton se esta presionando
        print("Boton presionado \(String(describing: sender.titleLabel?.text))")
        
        // Reproducira cada nota, dependiendo del boton que se seleccione
        reproducirNota((sender.titleLabel?.text)!)
    }
    
    func reproducirNota(_ cualNota: String) {
        
        /// 1.-
        /// Intenta buscar una cancion con el nombre y formato dado, si no lo logra
        /// sale de la funcion y ya no hace nada
        guard let urlSong = Bundle.main.url(forResource: cualNota, withExtension: "wav") else {
            return
        }
        
        /// 2.-
        /// Tratar de reproducir el contenido de una URL
        do {
            // Se prepara el reproductor con el sonido a reproducir, es decir
            // reproducira el sonido que este en "urlSong"
            player = try AVAudioPlayer(contentsOf: urlSong)
            
            // Si hay un reproductor, reproduce el sonido
            player?.play()
            
        } catch {
            print("Error al reproducri sonido")
        }
    }
    
}

