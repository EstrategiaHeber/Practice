//
//  ClimaModelo.swift
//  Clima
//
//  Created by HEBER JIMENEZ on 05/10/23.
//

// Esta estructura sera la encargada de convertir todos los datos objetidos de la red a formatos amigables
// para poder mostrarlos en la vista


import Foundation

struct ClimaModelo {
    
    let condicionId: Int
    let nombreCiudad: String
    let descripcionClima: String
    let temperaturaCelsius: Double
    
    // Propiedad computada que ayudara a evitar la interpolacion del String a la hora
    // de imprimir datos en la vista, es decir, recibira un double de la api,
    // y lo convertira a un string con un solo decimal
    var temperaturaDecimal: String {
        return String(format: "%.1f", temperaturaCelsius)
    }
    
    // Propiedad computada para las imagenes
    var fondoClima: String {
        // Retornara el nombre de la imagen, dependiendo el id que se le proporcione
        
        switch condicionId {
        case 200...232:
            return "tormenta"
        case 300...321:
            return "nubes"
        case 500...531:
            return "tormenta"
        case 600...622:
            return "nevando"
        case 700...781:
            return "soleado"
        case 800...804:
            return "despejado"
        default:
            return "despejado"
        }
    }
}
