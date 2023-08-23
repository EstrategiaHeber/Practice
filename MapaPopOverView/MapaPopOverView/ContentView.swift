//
//  ContentView.swift
//  MapaPopOverView
//
//  Created by ALAN CARO on 23/08/23.
//

//import SwiftUI
//import MapKit
//
//struct ContentView: View {
//
//    @StateObject var mapaViewModel = MapaViewModel()
//    @State private var selectedAnnotation: AnnotationItem?
//
//    var body: some View {
//
//        // El mapa se mostrara en la ubicacion actual del usuario "mapaViewModel.userLocation"
//        //Map(coordinateRegion: $mapaViewModel.userLocation, showsUserLocation: true)
//
//        /* EJEMPLO DE MOSTRAR PINES DE UBICACION SIN MOSTRAR EL PIN DE UBICACION DEL USUARIO
//
//         Map(coordinateRegion: $mapaViewModel.userLocation, annotationItems: mapaViewModel.locations) { location in
//            MapMarker(coordinate: location.coordinate)
//                }
//            .ignoresSafeArea()
//            .onAppear{
//                mapaViewModel.validarAutorizacion()
//            }
//         */
//
//        Map(coordinateRegion: $mapaViewModel.userLocation, showsUserLocation: true, annotationItems: mapaViewModel.locations) { location in
//
//            /*MapMarker(coordinate: location.coordinate)
//             }
//             .ignoresSafeArea()
//             .onAppear{
//             mapaViewModel.validarAutorizacion()
//             }*/
//            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)) {
//                Image(systemName: "mappin.circle.fill")
//                    .foregroundColor(.red)
//                    .font(.system(size: 24))
//                    .onTapGesture {
//                        // Acción al tocar el marcador
//                        print("Tocaste el marcador de \(location.title)")
//                    }
//            }
//        }
//        .ignoresSafeArea(.all)
//
//        // Valida el estatus de la autorizacion del usuario
//        if mapaViewModel.autorizacionOK {
//            Text("Localizacion aceptada")
//                .bold()
//                .padding(.top, 12)
//            Link("Pulsa para cambiar pa autorizacion", destination: URL(string: UIApplication.openSettingsURLString)!)
//                .padding(32)
//        } else {
//            Text("Localizacion NO aceptada")
//                .bold()
//                .padding(.top, 12)
//            Link("Pulsa para cambiar pa autorizacion", destination: URL(string: UIApplication.openSettingsURLString)!)
//                .padding(32)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

// ---------------------------------------------------------------------------------------------------------------

//import SwiftUI
//import MapKit
//
//struct MapView: View {
//    @State private var annotations: [AnnotationItem] = []
//    @State private var selectedAnnotation: AnnotationItem?
//
//    var body: some View {
//        ZStack {
//            Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.33182, longitude: -122.03118), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))), annotationItems: annotations) { annotation in
//                MapPin(coordinate: annotation.coordinate)
//                    .onTapGesture {
//                        selectedAnnotation = annotation
//                    }
//            }
//            .popover(item: $selectedAnnotation) { annotation in
//                VStack {
//                    Text("Información del pin")
//                    Text("Latitud: \(annotation.coordinate.latitude)")
//                    Text("Longitud: \(annotation.coordinate.longitude)")
//                }
//                .padding()
//            }
//
//            // You can add other views on top of the map here if needed
//        }
//        .onAppear {
//            // Load your annotations from somewhere (e.g., an API call or local data)
//            annotations = [
//                AnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 37.33182, longitude: -122.03118)),
//                AnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 37.33253, longitude: -122.03021)),
//                AnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 37.33365, longitude: -122.03240))
//            ]
//        }
//    }
//}
//
//struct AnnotationItem {
//    let id = UUID()
//    let coordinate: CLLocationCoordinate2D
//}
//
//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}


// ---------------------------------------------------------------------------------------------------------------


//import SwiftUI
//import MapKit
//
//struct ContentView: View {
//    @State private var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
//        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//    )
//
//    var body: some View {
//        Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: false, userTrackingMode: .none, annotationItems: locations) { location in
//            MapAnnotation(coordinate: location.coordinate) {
//                InfoView()
//            }
//        }
//    }
//
//    let locations: [Location] = [
//        Location(coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194))
//    ]
//}
//
//struct Location: Identifiable {
//    let id = UUID()
//    var coordinate: CLLocationCoordinate2D
//}
//
//struct InfoView: View {
//    var body: some View {
//        RoundedRectangle(cornerRadius: 10)
//            .foregroundColor(.white)
//            .overlay(
//                Text("Información del Marcador")
//                    .font(.headline)
//                    .padding()
//            )
//            .frame(width: 100, height: 100)
//    }
//}
//
////@available(iOS 15.0, *)
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var selectedAnnotation: Annotation?
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .none, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 24))
                        .onTapGesture {
                            selectedAnnotation = location
                        }
                }
            }
            
            if let selectedAnnotation = selectedAnnotation {
                ModalView(annotation: selectedAnnotation, isPresented: $selectedAnnotation)
            }
        }
    }
    
    let locations: [Annotation] = [
        Annotation(coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), title: "San Francisco", subtitle: "California"), Annotation(coordinate: CLLocationCoordinate2D(latitude: 37.78, longitude: -122.4294), title: "H", subtitle: "C")
        // Add more locations here
    ]
}

struct Annotation: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
    var title: String
    var subtitle: String
}

struct ModalView: View {
    let annotation: Annotation
    @Binding var isPresented: Annotation?
    
    var body: some View {
        VStack {
            Text(annotation.title)
                .font(.headline)
            Text(annotation.subtitle)
                .font(.subheadline)
            
            Button("Cerrar") {
                isPresented = nil
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .frame(width: 140, height: 150)
        //.frame(maxHeight: 400)
        .background(Color.white)
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .cornerRadius(10)
        //.shadow(radius: 10)
//        .padding()
//        .background(Color.white)
//        .cornerRadius(10)
//        .frame(width: 250, height: 150)
        //.onTapGesture(perform: {})
    }
}

@available(iOS 14.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

