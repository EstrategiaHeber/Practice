//
//  CalculadoraController.swift
//  CalculadoraIMC
//
//  Created by HEBER JIMENEZ on 02/10/23.
//

import Foundation
import UIKit

struct CalculadoraController {
    
    var imc: ModelIMC?
    
    mutating func calcularIMC(peso: Float, altura: Float) {
        
        //let alturaEnMetros = altura / 100
        
        let resultadoIMC = peso / (altura * altura)
        
        if resultadoIMC < 18.5 {
            imc = ModelIMC(valor: resultadoIMC, aviso: "Tu IMC es muy bajo, estas en riesgo de anemia, come mas porcion de alimentos ricos en vitaminas y minerales", color: UIColor.orange, image: UIImage(named: "flaco")!)
        } else if resultadoIMC <= 24.9 {
            imc = ModelIMC(valor: resultadoIMC, aviso: "Felicidades tu indice de masa corporal es normal, sigue como vas", color: UIColor.red, image: UIImage(named: "normal")!)
        } else if resultadoIMC <= 29.9 {
            imc = ModelIMC(valor: resultadoIMC, aviso: "Atencion, estas en principio de obesidad, haz mas ejercicio", color: UIColor.red, image: UIImage(named: "obesidad")!)
        } else {
            imc = ModelIMC(valor: resultadoIMC, aviso: "Atencion,tu indice de masa croporal es muy alto, tu salud esta en riesgo", color: UIColor.brown, image: UIImage(named: "sobrepeso")!)
        }
    }
    
    // Manda al ViewController el valor de IMC
    func retornarResultadoIMC() -> String {
        return String(format: "%.1f", imc?.valor ?? 0.0)
    }
    
    // Manda al ViewController el Aviso dado
    func retornarAviso() -> String {
        return imc?.aviso ?? "No hay informacion para mostrar"
    }
    
    // Manda al ViewController el Color dado
    func retornarColor() -> UIColor {
        //return imc?.color ?? UIColor.black
        return imc!.color!
    }
    
    // Manda al ViewController la Imagen dada
    func retornarImagen() -> UIImage {
        return imc!.image!
    }
}
