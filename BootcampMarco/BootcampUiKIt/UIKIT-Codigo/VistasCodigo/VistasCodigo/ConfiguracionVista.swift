//
//  configuracionVIsta.swift
//  VistasCodigo
//
//  Created by HEBER JIMENEZ on 19/10/23.
//

import Foundation
import UIKit

final class ConfiguracionVista: UIView {
    
    // MARK: - Creacion de vistas
    
    // * Creacion de una imagen
    private let ejemploImagen: UIImageView = {
        
        // Configuracion de la apariencia de la imagen
        
        // Se crea la instancia
        let imageView = UIImageView()
        // Configuracion de aspectRatio
        imageView.contentMode = .scaleAspectFit
        // Se agrega el nombre de la imagen a mostrar
        imageView.image = UIImage(systemName: "person")
        // Permite añadir comstrains por codigo
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // * Creacion de un Label
    private lazy var ejemploLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Hola ejemplo de label"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // * Creacion de un boton
    private lazy var ejemploButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Pulsa este boton"
        config.subtitle = "Subtitulo"
        
        let boton = UIButton(type: .system)
        boton.addTarget(self, action: #selector(showMessage), for: .touchUpInside)
        boton.configuration = config
        boton.translatesAutoresizingMaskIntoConstraints = false
        return boton
    }()
    
    @objc func showMessage() {
        print("Dando clic desde boton")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubviews()
        configureConstrains()
    }
    
    private func addSubviews() {
        // Se agrega la imagen que se mostrara
//        view.addSubview(ejemploImagen)
//        view.addSubview(ejemploLabel)
//        view.addSubview(ejemploButton)
        [ejemploImagen, ejemploLabel, ejemploButton].forEach(addSubview)
    }
    
    private func configureConstrains() {
        
        // Se agregan las constrains de las vistas que deseamos se miren
        NSLayoutConstraint.activate([
            
            // Constrains de Imagen
            /// Manda al elemento a la parte de hasta arriba ignorando la safe area
            //onboardingImageView.topAnchor.constraint(equalTo: view.topAnchor)
            /// Manda al elemento a la parte de hasta arriba respetando safe area
            //ejemploImagen.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            ejemploImagen.leadingAnchor.constraint(equalTo: leadingAnchor),
            ejemploImagen.trailingAnchor.constraint(equalTo: trailingAnchor),
            ejemploImagen.bottomAnchor.constraint(equalTo: ejemploLabel.topAnchor, constant: -32),
            
            
            // Constrains de Label
            ejemploLabel.bottomAnchor.constraint(equalTo: ejemploButton.topAnchor, constant: -42),
            ejemploLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            ejemploLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            ejemploLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // Constrains de Button
            ejemploButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            ejemploButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
