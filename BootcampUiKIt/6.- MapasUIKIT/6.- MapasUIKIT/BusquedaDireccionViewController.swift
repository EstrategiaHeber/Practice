//
//  DireccionViewController.swift
//  6.- MapasUIKIT
//
//  Created by HEBER JIMENEZ on 05/10/23.
//
// minuto 2:52:48

import UIKit
import MapKit

class BusquedaDireccionViewController: UIViewController {

    
    @IBOutlet weak var direccionBuscarTextField: UITextField!
    @IBOutlet weak var mapa: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        direccionBuscarTextField.delegate = self
        
        mapa.mapType = .satelliteFlyover
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func buscarDireccion() {
        
        // Eliminar puntos de ubicacion (anotaciones), que esten en el mapa
        self.mapa.removeAnnotations(self.mapa.annotations)
        
        /// CLGeocoder convierte coordenadas en lugares, y lugares en coordenadas, ayuda
        /// en la busqueda de lugares cercanos
        let geocoder = CLGeocoder()
        
        if let direccion = direccionBuscarTextField.text {
            geocoder.geocodeAddressString(direccion) { lugares, error in
                if error != nil {
                    self.monstrarAlerta(titulo: "Atencion", mensaje: "Error al buscar lugar")
                }
                
                if let lugar = lugares?.first {
                    // Crear anotacion en el mapa.
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = lugar.location!.coordinate
                    annotation.title = direccion
                    annotation.subtitle = "lat: \(String(describing: lugar.location?.coordinate.latitude)), lon: \(String(describing: lugar.location?.coordinate.longitude))"
                    
                    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    let region = MKCoordinateRegion(center: annotation.coordinate, span: span)
                    
                    self.mapa.setRegion(region, animated: true)
                    self.mapa.addAnnotation(annotation)
                    self.mapa.showsUserLocation = true
                    
                    // Metodo que le da funcionalidad al boton "go" del teclado virtual, a hora de introducir
                    // algo en el textField
                    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                        
                        // * Ocultar el teclado
                        // Primero se debe indicar de que textField se va ocultar el teclado
                        print("Hacer algo... \(String(describing: self.direccionBuscarTextField.text))")
                        textField.endEditing(true)
                        return true
                    }
                    
                    // Metodo que identifica cuando el usuario termina de editar y puede eliminar el contenido
                    // escrito en el textField
                    func textFieldDidEndEditing(_ textField: UITextField) {
                        print("EL usuario termino de editar el textfField")
                        textField.text = ""
                        textField.endEditing(true)
                    }
                    
                    // Metodo que le pregunta al delegado si deberia terminar la edicion, es decir
                    // evita que el cliente introduzca valores nulos en el textField (evalua si el texto es diferente a vacio)
                    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
                        
                        if textField.text != "" {
                            return true
                        } else {
                            // Si el usuario no ha escrito nada en el textField, NO desaparece el teclado, y muestra un alerta
                            
                            self.monstrarAlerta(titulo: "Atencion", mensaje: "Para buscar la informacion del clima, debes introducir el nombre de una ciudad o pais")
                            return false
                        }
                    }
                }
            }
        }
    }
}

extension BusquedaDireccionViewController: UITextFieldDelegate {
    
    // Metodo que le da funcionalidad al boton "go" del teclado virtual, a hora de introducir
    // algo en el textField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // * Ocultar el teclado
        // Primero se debe indicar de que textField se va ocultar el teclado
        print("Hacer algo... \(String(describing: direccionBuscarTextField.text))")
        textField.endEditing(true)
        return true
    }
    
    // Metodo que identifica cuando el usuario termina de editar y puede eliminar el contenido
    // escrito en el textField
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        print("EL usuario termino de editar el textfField")
        buscarDireccion()
        textField.text = ""
        textField.endEditing(true)
        
    }
    
    // Metodo que le pregunta al delegado si deberia terminar la edicion, es decir
    // evita que el cliente introduzca valores nulos en el textField (evalua si el texto es diferente a vacio)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if textField.text != "" {
            return true
        } else {
            // Si el usuario no ha escrito nada en el textField, NO desaparece el teclado, y muestra un alerta
            
            monstrarAlerta(titulo: "Atencion", mensaje: "Debes introducir una direccion para buscar")
            return false
        }
    }
    
    func monstrarAlerta(titulo: String, mensaje: String) {
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let accionAceptar = UIAlertAction(title: "OK", style: .default) { _ in
            // Do something
        }
        alerta.addAction(accionAceptar)
        present(alerta, animated: true)
    }
}
