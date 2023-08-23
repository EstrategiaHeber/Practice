//
//  MapaModel.swift
//  MapaPopOverView
//
//  Created by ALAN CARO on 23/08/23.
//

import Foundation
import MapKit


struct MapaModel: Identifiable {
    let id = UUID()
    let title: String
    let coordinate: CLLocationCoordinate2D
}

