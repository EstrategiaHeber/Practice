//
//  ViewController.swift
//  CalculadoraIMC
//
// https://www.youtube.com/watch?v=OPwsvkunP2A&ab_channel=MarcoAlonso
// minuto 1:20:00
// 2:35:03, 4:10:00
//
//  Created by HEBER JIMENEZ on 29/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    var peso : Float = 0.0
    var altura : Float = 0.0
    
    @IBOutlet weak var pesoLabel: UILabel!
    @IBOutlet weak var alturaLabel: UILabel!
    
    var calculadora = CalculadoraController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pesoLabel.text = "0.0 Kg"
        self.alturaLabel.text = "0.0 m"
    }
    
    @IBAction func sliderPeso(_ sender: UISlider) {
        let peso = String(format: "%.1f", sender.value)
        pesoLabel.text = "\(peso) Kg"
        self.peso = sender.value
    }
    
    
    @IBAction func sliderAltura(_ sender: UISlider) {
        
        let altura2Decimales = String(format: "%.2f", sender.value)
        alturaLabel.text = "\(altura2Decimales) m"
        self.altura = sender.value
    }
    
    @IBAction func calcularButton(_ sender: Any) {
//        print("EL PESO ES:")
//        print(peso)
//        print("LA ALTURA ES:")
//        print(altura)
        calculadora.calcularIMC(peso: peso, altura: altura)
        
        //print("EL RESULTADO ES:")
        //print(calculadora.retornarResultadoIMC())
        //print(calculadora.imc?.valor ?? 0.0)
        
        // * Navegar a ResultadoViewController, por medio del "segue"
        performSegue(withIdentifier: "goResultadoView", sender: self)
    }
    
    /// Metodo para enviar informacion atraves de un segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 1.- Se recupera el segue
        if segue.identifier == "goResultadoView" {
            
            // 2.- Se recupera la vista destino
            let resultado = segue.destination as! ResultadoViewController
            
            // 3.- Se manda la informacion requerdia a la vista destino
            
            // * Aqui se envia el objeto completo
            resultado.recibirResultadoIMC = calculadora.imc
            
            // * Aqui se envian todas las propiedades del objeto
            resultado.recibirValorIMC = calculadora.retornarResultadoIMC()
            resultado.recibirMensaje = calculadora.retornarAviso()
            resultado.recibirColor = calculadora.retornarColor()
            resultado.recibirImagen = calculadora.retornarImagen()
        }
    }
    
}

