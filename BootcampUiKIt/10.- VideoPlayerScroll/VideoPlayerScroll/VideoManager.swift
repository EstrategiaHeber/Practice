//
//  VideoManager.swift
//  VideoPlayerScroll
//
//  Created by HEBER JIMENEZ on 17/10/23.
//

import Foundation

// Protocolo Delegado
protocol VideoManagerProtocol {
    func mostrarVideos(listaVideos: [Video])
}

struct VideoManager {
    
    // Delegado
    var delegado: VideoManagerProtocol?
    
    func encontrarVideos(categoria: String) async {
        
        do {
            
            // Se crea la URL
            guard let url = URL(string: "https://api.pexels.com/videos/search?query=\(categoria)&locale=es-ES&per_page=80&orientation=portrait") else { return }
            
            // Se hace la request
            var urlRequest = URLRequest(url: url)
            
            // Envio de token
            urlRequest.setValue("BPuUOkpCZlGHv4bo9kU1mepVkcFUFcnG4LxF1bI4dk6iTSkWbR6wcjzU", forHTTPHeaderField: "Authorization")
            
            let (data, respuesta) = try await URLSession.shared.data(for: urlRequest)
            
            guard (respuesta as? HTTPURLResponse)?.statusCode == 200 else { return }
            
            let decoder = JSONDecoder()
            print("1234567")
            let dataDecodificada = try decoder.decode(ResponseDataModel.self, from: data)
            print("12345678")
            print("1")
            print(dataDecodificada)
            
            // Pasar la informacion al ViewController por medio del delegado
            let listaVideos = dataDecodificada.videos
            // Se le asigna los videos al delegado, para que la vista los consuma
            delegado?.mostrarVideos(listaVideos: listaVideos)
        } catch {
            print("Error")
        }
    }
}
