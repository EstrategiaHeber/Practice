//
//  EntretenimientoModel.swift
//  BenefitsUIKIT
//
//  Created by HEBER JIMENEZ on 27/09/23.
//

import Foundation

struct ResulBoleto: Decodable {
    
    var StatusCode: Int
    var Status: String
    var boleto: Boleto?
}

struct Boleto: Decodable {
    
    var IdBoleto: Int
    var Folio: String
    var VigenciaIni: String
    var VigenciaFin: String
    var FechaSolicitud: String
}


