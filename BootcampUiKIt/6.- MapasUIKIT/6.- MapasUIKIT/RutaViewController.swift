//
//  RutaViewController.swift
//  6.- MapasUIKIT
//
//  Created by HEBER JIMENEZ on 06/10/23.
//

import UIKit
import MapKit
import CoreLocation

class RutaViewController: UIViewController {
    
    @IBOutlet weak var lugarDestino: UITextField!
    @IBOutlet weak var mapa: MKMapView!
    
    var managerLocation = CLLocationManager()
    var lalitud: Double?
    var longitud: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lugarDestino.delegate = self
        self.mapa.delegate = self
        managerLocation.delegate = self
        managerLocation.requestLocation()
        
        // Tipo de mapa
        mapa.mapType = .satellite
    }
    
    //
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func buscarLugar() {
        
        // Eliminar puntos de ubicacion (anotaciones), que esten en el mapa
        self.mapa.removeAnnotations(self.mapa.annotations)
        self.mapa.removeOverlays(mapa.overlays)
        
        /// CLGeocoder convierte coordenadas en lugares, y lugares en coordenadas, ayuda
        /// en la busqueda de lugares cercanos
        let geocoder = CLGeocoder()
        
        if let direccion = lugarDestino.text {
            
            geocoder.geocodeAddressString(direccion) { lugares, error in
                
                if error != nil {
                    self.monstrarAlerta(titulo: "Atencion", mensaje: "Error al enconytrar lugar destino")
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
                    
                    self.trazarRuta(coordenadasDestino: lugar.location!.coordinate)
                }
            }
        }
    }
    
    // Buscara y trazara una ruta entre dos puntos
    // Las coordenadas origen se obtendran de la ubicacion de usuario
    // Las coordenadas destino se obtendran de lo que reciba este metodo
    func trazarRuta(coordenadasDestino: CLLocationCoordinate2D) {
        
        print("Trazando ruta")
        
        // Empieza a obtener la ubicacion del usuario
        self.managerLocation.startUpdatingLocation()
        
        // Obtiene las coordenadas origen
        let coordenadasOrigen = CLLocationCoordinate2D(latitude: self.lalitud ?? 0, longitude: self.longitud ?? 0)
        //print("Latitud \(self.lalitud)")
        //print("Longitud \(self.longitud)")
        
        // Creacion de anotacion de punto de origen
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordenadasOrigen
        annotation.title = "Estas aqui"
        // Se agrega al mapa
        self.mapa.addAnnotation(annotation)
        
        // Crear un MKPlacemark origen-destino
        /// Es una descripcion amigable con el usuario de una locacion en el mapa, es decir contiene unbicacion, nombre, direccion, coordenadas
        let origenPlacemark = MKPlacemark(coordinate: coordenadasOrigen)
        let destinoPlacemark = MKPlacemark(coordinate: coordenadasDestino)
        
        // Crear un mapKit Item
        let origenItem = MKMapItem(placemark: origenPlacemark)
        let destinoItem = MKMapItem(placemark: destinoPlacemark)
        
        // Solicitud para crear una ruta
        /// Hace el trazado de la linea (ruta), hace el calculo de la ruta desde el punto origen hasta el punto destino
        let solicitudRuta = MKDirections.Request()
        /// Punto de partida
        solicitudRuta.source = origenItem
        /// EndPoint
        solicitudRuta.destination = destinoItem
        
        // Como se realizara el viaje (pie, bici, auto, transporte público)
        solicitudRuta.transportType = .automobile
        // Calcula rutas alternas, al mismo tiempo que se va avanzando en la ruta (metodo opcional)
        solicitudRuta.requestsAlternateRoutes = true
        
        // Almacena todas las direcciones que se brindaran (vuelta izquierda, vuelta derecha)
        let direcciones = MKDirections(request: solicitudRuta)
        
        // Si se pudo calcular la ruta o no
        direcciones.calculate { respuesta, error in
            
            // Se evalua si hubo un error
            if error != nil {
                self.monstrarAlerta(titulo: "ERROR", mensaje: "No se pudo calcular la ruta, intenta con otro destino")
            }
            
            // Se recupera la respuesta
            if let respuestaRuta = respuesta {
                // Se recupera la primer ruta de todas las posibles existentes
                if let rutaDefault = respuestaRuta.routes .first {
                    // Se pintara en el mapa la linea de la ruta
                    self.mapa.addOverlay(rutaDefault.polyline)
                    self.mapa.setVisibleMapRect(rutaDefault.polyline.boundingMapRect, animated: true)
                }
            }
        }
    }
}

// MARK: Pintar la linea de ruta en el mapa
extension RutaViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderizado = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        // Color de la linea de trazado de ruta
        renderizado.strokeColor = .black
        return renderizado
    }
}


// MARK: textField
extension RutaViewController: UITextFieldDelegate {
    // Metodo que le da funcionalidad al boton "go" del teclado virtual, a hora de introducir
    // algo en el textField
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
        
        self.buscarLugar()
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
    
    func monstrarAlerta(titulo: String, mensaje: String) {
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let accionAceptar = UIAlertAction(title: "OK", style: .default) { _ in
            // Do something
        }
        alerta.addAction(accionAceptar)
        present(alerta, animated: true)
    }
    
}

// MARK: Mapa

extension RutaViewController: CLLocationManagerDelegate {
    
    // Metodo que extrae la ubicacion
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
}
