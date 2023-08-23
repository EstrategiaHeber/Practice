//
//  MapaViewModel.swift
//  MapaPopOverView
//
//  Created by ALAN CARO on 23/08/23.
//

import Foundation
import CoreLocation

// MARK: Este es el permiso que debe tener el mapa para pedir autorizacion de que la app pueda acceder a su ubicacion
// "NSLocationWhenInUseUsageDescription"

import Foundation
import CoreLocation
import MapKit

final class MapaViewModel: NSObject, ObservableObject {
    
    // Esta es la ubicacion para que el mapa se muestre en una ubicacion por default, al iniciar la app, antes de que el usuario conceda la autorizacion para acceder a su ubicacion
    private struct DefaultRegion {
        static let latitude = 19.42847
        static let longitude = -99.12766
    }
    
    // Esto es para inidcar la cantidad de zoom que tendra la ubicacion
    private struct Span {
        static let delta = 0.08
    }
    
    // Notificador de la ubicacion actual del usuario
    @Published var userLocation: MKCoordinateRegion = .init()
    // Notificador de los puntos de ubicacon
    @Published var locations: [MapaModel] = [
        MapaModel(title: "Ubicación 1", coordinate: CLLocationCoordinate2D(latitude: 19.4300100, longitude: -99.1638006)),
        MapaModel(title: "Ubicación 2", coordinate: CLLocationCoordinate2D(latitude: 19.4271441, longitude: -99.1655380))
    ]
    // Notificador de la autorizacion del usuario
    @Published var autorizacionOK: Bool = false
    private let locationManager: CLLocationManager = .init()
    
    override init() {
        super.init()
        // Mejor precision en la ubicacion
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // Solicita la ubicacion cuando la app esta en uso
        locationManager.requestWhenInUseAuthorization()
        // Solicita actualizacion de la ubicacion del usuario
        locationManager.startUpdatingLocation()
        // Seremos los encargados de la actualizacion de la ubicacion del usuario
        locationManager.delegate = self
        
        // Ubicacion por defecto que se mostrara al ininciar la app
        userLocation = .init(center: .init(latitude: DefaultRegion.latitude, longitude: DefaultRegion.longitude), span: .init(latitudeDelta: Span.delta, longitudeDelta: Span.delta))
    }
    
    // Funcion que verifica si el usuario concedio el permiso para acceder a su ubicacion o no.
    func validarAutorizacion() {
        let status = locationManager.authorizationStatus
        switch status {
        case .notDetermined, .restricted, .denied:
            print("** El usuario NO autorizo")
            autorizacionOK = false
        case .authorizedAlways, .authorizedWhenInUse:
            print("** El usuario SI autorizao")
            autorizacionOK = true
        @unknown default:
            print("NO se que paso")
        }
        //print("LA AUTORIZACION ES: \(status.rawValue.description)")
    }
}

extension MapaViewModel: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Ya me ejecute")
        // Location es la ubicacion actual del usuario
        guard let location = locations.last else {return}
        print("LA UBICACION ES: \(location.coordinate.latitude)")
        
        // Asignamos la ubicacion del usuario, para que se notifique y que las vistas
        // puedan hacer lo que requieran con l¿esa ubicacion
        userLocation = .init(center: location.coordinate, span: .init(latitudeDelta: Span.delta, longitudeDelta: Span.delta))
    }
    
    // Funcion para la autorizacion del usuario
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        validarAutorizacion()
    }
}
