//
//  ViewController.swift
//  6.- MapasUIKIT
//
//  Created by HEBER JIMENEZ on 05/10/23.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    var manager = CLLocationManager()
    
    var lalitud: Double?
    var longitud: Double?

    @IBOutlet weak var mapa: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    @IBAction func coordenadasButton(_ sender: UIBarButtonItem) {
        
        if let lat = self.lalitud, let lon = self.longitud {
            monstrarAlerta(titulo: "Ubicación actual", mensaje: "lat: \(lat), lon: \(lon)")
        }
        
    }
    
    @IBAction func zoomButton(_ sender: UIBarButtonItem) {
        
        //Extraccion segura de un valor opcional
        guard let lalitud, let longitud else {return}
        let ubicacionMapa = CLLocationCoordinate2D(latitude: lalitud, longitude: longitud)
        
        // Nivel de zoom de mapa
        let spanMapa = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let regionMapa = MKCoordinateRegion(center: ubicacionMapa, span: spanMapa)
        
        // Agregar region al mapa y mostrar la ubicacion del usuario
        mapa.setRegion(regionMapa, animated: true)
        mapa.showsUserLocation = true
    }
}

// MARK: Localizacion

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        /// Se obtendra la ubicacion y guardar las coordenadas, para cuando el usuario las requiera se le muestren en un alerta
        if let ubicacion = locations.first?.coordinate {
            self.lalitud = ubicacion.latitude
            self.longitud = ubicacion.longitude
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error al obtener la ubicacion")
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



