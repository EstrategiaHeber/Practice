//
//  ProductosManager.swift
//  ProductosOnline
//
//  Created by HEBER JIMENEZ on 11/10/23.
//

import Foundation
import UIKit

struct ProductosManager {
    
    func obtenerProductos(completion: @escaping ([Product]) -> ()) {
        
        guard let url = URL(string: "https://dummyjson.com/products") else { return }
        
        let tarea = URLSession.shared.dataTask(with: url) { data, _, error in
            // Desenvolver data
            guard let data = data, error == nil else  {
                print("Error al obtener productos")
                
                return
            }
            
            // Decodificar la data y devolverla al VC
            do {
                let listaProductos = try JSONDecoder().decode(ProductoModel.self, from: data)
                completion(listaProductos.products)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        tarea.resume()
        
    }
    
    // Metodo 1 para descargar imagen desde url
    func obtenerImagenCompletion(urlString: String, completionHandler: @escaping(_ image: UIImage?, _ error: Error?) ->()) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data,
                  let image = UIImage(data: data),
                  let _ = response else { return }
            completionHandler(image, nil)
            
        }
        .resume()
    }
}

// Metodo 2 para descargar imagen desde url
// Se le agregara una funcionalidad a todas las ImageView
extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {return}
        let sesion = URLSession(configuration: .default)
        
        let tarea = sesion.dataTask(with: url) { datos, _, error in
            if let datosSeguros = datos {
                if let loadedImage = UIImage(data: datosSeguros) {
                    DispatchQueue.main.async {
                        self.image = loadedImage
                    }
                }
            }
            
        }
        tarea.resume()
    }
}
