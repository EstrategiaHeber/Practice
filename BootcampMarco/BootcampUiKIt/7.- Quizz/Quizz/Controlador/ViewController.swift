//
//  ViewController.swift
//  Quizz
//
//  Created by HEBER JIMENEZ on 09/10/23.
//
// https://www.youtube.com/watch?v=DIT_a5ehJ4M&ab_channel=MarcoAlonso
// minuto 1

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var puntajeLabel: UILabel!
    @IBOutlet weak var imagenPregunta: UIImageView!
    @IBOutlet weak var textoPregunta: UILabel!
    @IBOutlet weak var verdaderoButton: UIButton!
    @IBOutlet weak var falsoButton: UIButton!
    @IBOutlet weak var progreso: UIProgressView!
    
    var quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurarUI()
    }
    
    // Configuración de la imagen de cada pregunta
    func configurarUI() {
        /// Esquinas redondeadas
        imagenPregunta.layer.cornerRadius = 20
        /// Recortar cualquier contenido dentro de la imagen
        imagenPregunta.layer.masksToBounds = true
        
        mostrarPregunta()
    }
    
    /// Cuando el usuario ejecuta la aplicacion por primera vez, muestra la primer pregunta,
    /// y se sigue mandando a llamar cada que se desee mostrar una prgeunta
    func mostrarPregunta() {
        
        habilitarBotones()
        verdaderoButton.backgroundColor = .white
        falsoButton.backgroundColor = .white
        textoPregunta.text = quizManager.obtenerTextoPregunta()
        textoPregunta.textColor = quizManager.obtenerColor()
        imagenPregunta.image = quizManager.obtenerImagen()
        progreso.progress = quizManager.obtenerProgreso()
        puntajeLabel.text = "Puntaje: \(quizManager.obtenerPuntuacion()) pts."
    }
    
    func deshabilitarBotones() {
        verdaderoButton.isUserInteractionEnabled = false
        falsoButton.isUserInteractionEnabled = false
    }
    
    func habilitarBotones() {
        verdaderoButton.isUserInteractionEnabled = true
        falsoButton.isUserInteractionEnabled = true
    }

    @IBAction func respuestaUsuarioButton(_ sender: UIButton) {
        //print(sender.titleLabel?.text ?? "Vacio")
        
        deshabilitarBotones()
        
        let respuestaUsuario = sender.titleLabel?.text ?? "Vacio"
        
        //let respuestaCorrecta = quizManager.revisarRespuesta(respuestaUsuario: respuestaUsuario)
        
        /// Se evalua si la respuesta es correcta o incorrecta
        if quizManager.revisarRespuesta(respuestaUsuario: respuestaUsuario) {
            print("Verdadeross")
            sender.backgroundColor = UIColor.green
        } else {
            print("Falsoss")
            sender.backgroundColor = UIColor.red
        }
        
        /// Se cambia l apregunta
        
        if quizManager.siguientePregunta() {
            /// Avanza a la siguiente pregunta
            
            /// Despues de "X" segundos cambia de pregunta
            
            /// 1.- Se crea un timmer
            let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(cambiarPregunta), userInfo: nil, repeats: false)
            
        } else {
            // Fin del quiz
            
            /// Vibracion
            let generator = UINotificationFeedbackGenerator()
            /// Exsiten diferentes tipos de vibracion
            generator.notificationOccurred(.warning)
            
            monstrarAlerta(titulo: "Atención", mensaje: "Llegaste al final del quizz. Quieres empesar de nuevo?")
            // Muestra alerta
        }
    }
    
    @objc func cambiarPregunta() {
        // Pedir mas informacion
        mostrarPregunta()
        
        // Regresar al color original los botones
//        verdaderoButton.backgroundColor = .white
//        falsoButton.backgroundColor = .white
    }
    
    func monstrarAlerta(titulo: String, mensaje: String) {
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        
        let accionAceptar = UIAlertAction(title: "OK", style: .default) { _ in
            // Do something
            self.quizManager.numeroPregunta = 0
            self.quizManager.puntuacion = 0
            self.mostrarPregunta()
        }
        
        let accionCancelar = UIAlertAction(title: "CANCELAR", style: .destructive) { _ in
            // Do something
        }
        alerta.addAction(accionAceptar)
        alerta.addAction(accionCancelar)
        present(alerta, animated: true)
    }
}

