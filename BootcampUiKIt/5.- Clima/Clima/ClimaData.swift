//
//  ClimaData.swift
//  Clima
//
//  Created by HEBER JIMENEZ on 04/10/23.
//

import Foundation

struct ClimaData: Decodable {
    let name: String
    let cod: Int
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let id: Int
}

