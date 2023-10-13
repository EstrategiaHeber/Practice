//
//  LugaresCercanosViewController.swift
//  6.- MapasUIKIT
//
//  Created by HEBER JIMENEZ on 06/10/23.
//

import UIKit
import MapKit
import CoreLocation

class LugaresCercanosViewController: UIViewController {
    
    var locationManager = CLLocationManager()
    var userLocation: CLLocation?

    @IBOutlet weak var mapa: MKMapView!
    @IBOutlet weak var lugaresCercanosTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lugaresCercanosTextField.delegate = self
        locationManager.delegate = self
        
        // Pide la ubicacion del usuario
        locationManager.requestLocation()
        
        mapa.mapType = .hybrid
    }
    
    func monstrarAlerta(titulo: String, mensaje: String) {
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let accionAceptar = UIAlertAction(title: "OK", style: .default) { _ in
            // Do something
        }
        alerta.addAction(accionAceptar)
        present(alerta, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func buscarLugares(lugar: String) {
        
        // eliminar anotaciones existentes
        self.mapa.removeAnnotations(self.mapa.annotations)
        
        // Recuperar la ubicacion del usuario
        guard let userLocation else { return }
        
        // Realizar busqueda al rededor de la ubicacion dle usuario
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = lugar
        
        // Distancia a la redonda de la ubicacion, en donde se requiere mostrar lugares
        request.region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 3000, longitudinalMeters: 3000)
        
        // Busqueda de lugares
        let search = MKLocalSearch(request: request)
        search.start { respuestaLugaresCercanos, error in
            
            if error != nil {
                self.monstrarAlerta(titulo: "Atencion", mensaje: "Error al buscar lugares, intenta de nuevo")
            }
            
            guard let respuestaLugaresCercanos else { return }
            
            for item in respuestaLugaresCercanos.mapItems {
                let annotation = MKPointAnnotation()
                annotation.coordinate = item.placemark.coordinate
                annotation.title = item.name
                annotation.subtitle = lugar
                self.mapa.addAnnotation(annotation)
            }
        }
        
        // Nivel del zoom en el mapa
        let spanMapa = MKCoordinateSpan(latitudeDelta: 0.09, longitudeDelta: 0.09)
        let regionMapa = MKCoordinateRegion(center: userLocation.coordinate, span: spanMapa)
        
        self.mapa.setRegion(regionMapa, animated: true)
        self.mapa.showsUserLocation = true
    }
    
}

// MARK: TextField
extension LugaresCercanosViewController: UITextFieldDelegate {
    
    /// Metodo que le da funcionalidad al boton "go" del teclado virtual, a hora de introducir algo en el textField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // * Ocultar el teclado
        // Primero se debe indicar de que textField se va ocultar el teclado
        print("Hacer algo... \(String(describing: textField.text))")
        textField.endEditing(true)
        return true
    }
    
    // Metodo que identifica cuando el usuario termina de editar y puede eliminar el contenido
    // escrito en el textField
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("EL usuario termino de editar el textfField")
        buscarLugares(lugar: lugaresCercanosTextField.text?.replacingOccurrences(of: " ", with: "") ?? "ValorDefecto")
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
            
            monstrarAlerta(titulo: "Atencion", mensaje: "Para buscar la informacion del clima, debes introducir el nombre de una ciudad o pais")
            return false
        }
    }
}

// MARK: CLLocationManagerDelegate
/// Para que se ejecuten estos metodos, es necesario definir el delegado de locationManager
extension LugaresCercanosViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Se guarda la ubicacion en la variable global
        self.userLocation = locations.last
        print("Se obtuvo la ubicacion \(userLocation?.coordinate)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error al obtener ubicacion")
    }
}
