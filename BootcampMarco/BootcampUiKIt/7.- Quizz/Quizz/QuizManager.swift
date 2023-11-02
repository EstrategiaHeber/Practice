//
//  QuizManager.swift
//  Quizz
//
//  Created by HEBER JIMENEZ on 09/10/23.
//

import Foundation
import UIKit

struct QuizManager {
    
    let preguntas = [
        
        PreguntaModelo(texto: "Tokio siempre ha sido la capital de Japón.", respuesta: "Falso", imagen: UIImage(named: "tokio")!, color: UIColor.gray),
        PreguntaModelo(texto: "Los nativos americanos enterraban sus hachas cuando hacían las pases.", respuesta: "Verdadero", imagen: UIImage(named: "nativos")!, color: UIColor.brown),
        PreguntaModelo(texto: "El aluminio fue una vez más valioso que el oro.", respuesta: "Verdadero", imagen: UIImage(named: "oro")!, color: UIColor.purple),
        PreguntaModelo(texto: "El papel de aluminio amplifica el Wifi.", respuesta: "Verdadero", imagen: UIImage(named: "aluminio")!, color: UIColor.red),
        PreguntaModelo(texto: "Google inicialmente se llamaba BackRub.", respuesta: "Verdadero", imagen: UIImage(named: "google")!, color: UIColor.blue),
        PreguntaModelo(texto: "El cráneo es el hueso más fuerte del cuerpo humano.", respuesta: "Falso", imagen: UIImage(named: "craneo")!, color: UIColor.yellow),
        PreguntaModelo(texto: "La Coca Cola esta disponible en todos los países del mundo.", respuesta: "Falso", imagen: UIImage(named: "coca")!, color: UIColor.green),
        PreguntaModelo(texto: "Ningún papa ha muerto nunca violentamente.", respuesta: "Falso", imagen: UIImage(named: "papa")!, color: UIColor.red),
        PreguntaModelo(texto: "El brócoli contiene más vitamina C que los limones.", respuesta: "Verdadero", imagen: UIImage(named: "brocoli")!, color: UIColor.black),
        PreguntaModelo(texto: "Los relámpagos se ven antes de escucharse porque la luz viaja más rápido que el sonido.", respuesta: "Verdadero", imagen: UIImage(named: "rayo")!, color: UIColor.orange),
        PreguntaModelo(texto: "Cuantos más megapíxeles, mejor calidad de imagen.", respuesta: "Falso", imagen: UIImage(named: "pixeles")!, color: UIColor.black),
        PreguntaModelo(texto: "Una ciudad perdida yace bajo el mar Mediterráneo.", respuesta: "Verdadero", imagen: UIImage(named: "mar")!, color: UIColor.black),
        PreguntaModelo(texto: "El punto llamado NEMO es el punto más difícil de alcanzar de todo el planeta.", respuesta: "Verdadero", imagen: UIImage(named: "nemo")!, color: UIColor.black)
        
    ]
    
    /// Indica la puntuacion del usuario
    var puntuacion = 0
    /// Indice que indica en que pregunta va el usuario
    var numeroPregunta = 0
    
    mutating func revisarRespuesta(respuestaUsuario: String) -> Bool {
        
        /// Si la respuesta del usuario es igual a PreguntaModelo.respuesta regresamos true
        if respuestaUsuario == preguntas[numeroPregunta].respuesta {
            /// Incrementa el numero de la pregunta
            puntuacion += 1
            return true
        } else {
            return false
        }
    }
    
    func obtenerPuntuacion () -> Int {
        
        return puntuacion
    }
    
    func obtenerTextoPregunta() -> String {
        return preguntas[numeroPregunta].texto
    }
    
    func obtenerProgreso() -> Float {
        
        /// Se calcula el progreso del usuario
        let progreso = Float(numeroPregunta + 1) / Float(preguntas.count)
        return progreso
    }
    
    func obtenerColor() -> UIColor {
        return preguntas[numeroPregunta].color
    }
    
    func obtenerImagen() -> UIImage {
        return preguntas[numeroPregunta].imagen
    }
    
    /// Saber si hay preguntas o no
    mutating func siguientePregunta() -> Bool {
        
        /// Aun hay preguntas por resolver
        if numeroPregunta + 1 < preguntas.count {
            numeroPregunta += 1
            return true
        }
        else {
            /// Se ha llegado al final del test
            numeroPregunta = 0
            puntuacion = 0
            return false
        }
    }
}
