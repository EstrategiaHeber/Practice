//
//  TduModel.swift
//  BenefitsUIKIT
//
//  Created by HEBER JIMENEZ on 27/09/23.
//

import Foundation
import MapKit

// Rellenar la tabla GirosTDUEntity
struct ResultGiros: Decodable {
    
    var id: Int
    var nombre: String
    var orden: Int
}

// Rellenar la tabla EstadosTDUEntity
struct Estado: Codable {
    let id: Int
    let nombre: String
}
