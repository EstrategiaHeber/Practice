//
//  ViewController.swift
//  Clima
//
//  Created by HEBER JIMENEZ on 03/10/23.
//
// https://www.youtube.com/watch?v=DjjvfUGU_EU&ab_channel=MarcoAlonso
// minuto 2:14

// appKey: 698cb29c0a1e70d1a30a0a9982f6a95a
// https://api.openweathermap.org/data/2.5/weather?appid=698cb29c0a1e70d1a30a0a9982f6a95a&units=metric&long=es&q=brasil

import UIKit
import CoreLocation

// 3.- Adoptar el protocolo
class ViewController: UIViewController, ClimaManagerDelegate {
    
    var manager = ClimaManager()
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var fondoClimaImagen: UIImageView!
    @IBOutlet weak var nombreCiudadTextField: UITextField!
    @IBOutlet weak var climaImageView: UIImageView!
    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var descripcionClimaLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 5.- Definir el delegado, es decir la clase "ViewCOntroller" es el delegado del manager,
        // es decir, la clase "ViewCOntroller" es la encargada de ejecutar los metodos del protocolo
        manager.delegado = self
        manager.fetchClima(nombrePais: "morelia")
        
        // Definir el delegado del textField
        self.nombreCiudadTextField.delegate = self
        
        // Definir el delegado de CLLocation
        locationManager.delegate = self
        // Pide permiso para acceder a la ubicacion
        locationManager.requestWhenInUseAuthorization()
        // Pide ubicacion de usuario
        //locationManager.requestLocation()
    }
    
    @IBAction func ubicacionButton(_ sender: Any) {
        print("Obtener ubicación del GPS")
        locationManager.requestLocation()
    }
    
    // 4.- Implementar metodos de ¿l protocolo
    func actualizarClima(clima: ClimaModelo) {
        print("clima desde view controller")
        
        // Toda la parte visual se debe ejecutar en el hilo principal
        DispatchQueue.main.async {
            self.descripcionClimaLabel.text = "En \(clima.nombreCiudad) el clima esta: \(clima.descripcionClima)"
            self.temperaturaLabel.text = clima.temperaturaDecimal
            self.fondoClimaImagen.image = UIImage(named: "\(clima.fondoClima)")
        }
    }
    
    func existeError(cualError: String) {
        print("Existe Error")
    }
    
    // Metodo que permite la finalizacion de la edicion del textField, cuando
    // se recibe un toque(clic) en cualquier parte de la vista
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        print("Se toco la pantalla")
    }
}

// MARK: textField

// Se adopta el protocolo "UITextFieldDelegate" para administrar y gestionar la edicion y
// la validacion de los campos de todos los campos de texto
extension ViewController: UITextFieldDelegate {
    
    // Metodo que le da funcionalidad al boton "go" del teclado virtual, a hora de introducir
    // algo en el textField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // * Ocultar el teclado
        // Primero se debe indicar de que textField se va ocultar el teclado
        print("Hacer algo... \(String(describing: nombreCiudadTextField.text))")
        nombreCiudadTextField.endEditing(true)
        return true
    }
    
    // Metodo que identifica cuando el usuario termina de editar y puede eliminar el contenido
    // escrito en el textField
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("EL usuario termino de editar el textfField")
        
        // Se crea una variable con el reemplazo de espacios vacios con %20 para escaparlos
        let ciudad = nombreCiudadTextField.text!.replacingOccurrences(of: " ", with: "%20")
        manager.fetchClima(nombrePais: ciudad)
        nombreCiudadTextField.text = ""
    }
    
    // Metodo que le pregunta al delegado si deberia terminar la edicion, es decir
    // evita que el cliente introduzca valores nulos en el textField (evalua si el texto es diferente a vacio)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if nombreCiudadTextField.text != "" {
            return true
        } else {
            // Si el usuario no ha escrito nada en el textField, NO desaparece el teclado, y muestra un alerta
            
            monstrarAlerta(titulo: "Atencion", mensaje: "Para buscar la informacion del clima, debes introducir el nombre de una ciudad o pais")
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

// MARK: Ubicacion

// Se adopta el protocolo "CLLocationManagerDelegate" que ser el que nos permita hacer acciones de ubicacion
extension ViewController: CLLocationManagerDelegate {
    
    // Le dice al delgado que hay una nueva ubicacion, y brinda las coordenadas del usuario
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Se obtuvo la ubicacion")
        if let ubicacion = locations.first {
            
            let latitud = ubicacion.coordinate.latitude
            let longitud = ubicacion.coordinate.longitude
            print(latitud)
            print(longitud)
            
            self.manager.fetchClima(latitud: latitud, longitud: longitud)
        }
    }
    
    // Existe un error al obtener la ubicacion
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error al obtener tu ubicacion")
    }
    
    // Cachar cada cambio en los permisos de ubicacion
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            // Acceder a la ubicacion
            locationManager.requestLocation()
            // Este metodo en todo momento esta canalizando la ubicacion del usuario
            //locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        @unknown default:
            fatalError("Error desconocido: /")
        }
    }
}

