//
//  ViewController.swift
//  UIButtonPorCodigo
//
//  Created by HEBER JIMENEZ on 19/10/23.
//
// https://www.youtube.com/watch?v=lA1g6qO8cGg&list=PLeTOFRUxkMcqcSYTxtRPgc-qaLtWfdFTc&index=3&ab_channel=SwiftBeta
// minuto 7:43

import UIKit

class ViewController: UIViewController {
    
    private let ejemplo1Boton: UIButton = {
        
        var configuracion = UIButton.Configuration.filled()
        configuracion.title = "Hola, soy ejemplo1"
        configuracion.subtitle = "Subtitulo"
        configuracion.image = UIImage(systemName: "play.circle.fill")
        
        let boton = UIButton(type: .system)
        boton.configuration = configuracion
        boton.translatesAutoresizingMaskIntoConstraints = false
        return boton
        
    }()
    
    private let ejemplo2Boton: UIButton = {
        
        var configuracion = UIButton.Configuration.filled()
        configuracion.title = "Hola, soy ejemplo2"
        configuracion.titleAlignment = .center
        configuracion.subtitle = "Subtitulo"
        configuracion.image = UIImage(systemName: "play.circle.fill")
        configuracion.imagePadding = 12
        configuracion.imagePlacement = .trailing
        
        let boton = UIButton(type: .system)
        boton.configuration = configuracion
        boton.translatesAutoresizingMaskIntoConstraints = false
        return boton
        
    }()
    
    private let ejemplo3Boton: UIButton = {
        
        var configuracion = UIButton.Configuration.bordered()
        configuracion.title = "Hola, soy ejemplo3"
        configuracion.titleAlignment = .center
        configuracion.subtitle = "Subtitulo"
        configuracion.image = UIImage(systemName: "play.circle.fill")
        configuracion.imagePadding = 12
        configuracion.imagePlacement = .trailing
        
        let boton = UIButton(type: .system)
        boton.configuration = configuracion
        boton.translatesAutoresizingMaskIntoConstraints = false
        return boton
        
    }()
    
    private let ejemplo4Boton: UIButton = {
        
        var configuracion = UIButton.Configuration.bordered()
        configuracion.title = "Hola, soy ejemplo4"
        configuracion.titleAlignment = .center
        configuracion.subtitle = "Subtitulo"
        configuracion.image = UIImage(systemName: "play.circle.fill")
        configuracion.imagePadding = 12
        configuracion.imagePlacement = .top
        configuracion.buttonSize = .large
        configuracion.baseBackgroundColor = .brown
        configuracion.baseForegroundColor = .white
        
        let boton = UIButton(type: .system)
        boton.configuration = configuracion
        boton.translatesAutoresizingMaskIntoConstraints = false
        return boton
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(ejemplo1Boton)
        view.addSubview(ejemplo2Boton)
        view.addSubview(ejemplo3Boton)
        view.addSubview(ejemplo4Boton)
        
        // constrains
        
        NSLayoutConstraint.activate([
            ejemplo1Boton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            ejemplo1Boton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ejemplo2Boton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ejemplo2Boton.topAnchor.constraint(equalTo: ejemplo1Boton.bottomAnchor, constant: 8),
            
            ejemplo3Boton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ejemplo3Boton.topAnchor.constraint(equalTo: ejemplo2Boton.bottomAnchor, constant: 8),
            
            ejemplo4Boton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ejemplo4Boton.topAnchor.constraint(equalTo: ejemplo3Boton.bottomAnchor, constant: 8)
        ])
    }


}

