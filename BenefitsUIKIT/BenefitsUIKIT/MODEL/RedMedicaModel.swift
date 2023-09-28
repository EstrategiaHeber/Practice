//
//  RedMedicaModel.swift
//  BenefitsUIKIT
//
//  Created by HEBER JIMENEZ on 27/09/23.
//

import Foundation

struct ResultsCat: Decodable {
    
    var StatusCode: Int
    var Status: String
    //let TDC: String?
    //var CatEdoCiuVrim: [CatEdoCd]?
    //let RedMedica: [ResultFiltroRM]?
}

struct CatEdoCd: Decodable {
    
    var Id: Int
    var Estado: String
    var Ciudad: String
    //let imagen: BienestarImgTit
    //let titulo: String
    //let contenido: String
}
