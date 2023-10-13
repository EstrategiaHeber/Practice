//
//  ProductoModel.swift
//  ProductosOnline
//
//  Created by HEBER JIMENEZ on 11/10/23.
//

import Foundation

struct ProductoModel: Codable {
    
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable {
    
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
