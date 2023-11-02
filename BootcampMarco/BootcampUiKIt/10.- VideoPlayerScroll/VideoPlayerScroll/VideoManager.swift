//
//  VideoManager.swift
//  VideoPlayerScroll
//
//  Created by HEBER JIMENEZ on 17/10/23.
//
// https://api.pexels.com/videos/popular

import Foundation

// Protocolo Delegado
protocol VideoManagerProtocol {
    func mostrarVideos(listaVideos: [Video])
}

protocol VideoManagerPopularProtocol {
    func mostrarVideos(listaVideos: [VideoPopular])
}

struct VideoManager {
    
    // Delegado
    var delegado: VideoManagerProtocol?
    
    var delegadoPopular: VideoManagerPopularProtocol?
    
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
            
            let dataDecodificada = try decoder.decode(ResponseDataModel.self, from: data)
            
            //print(dataDecodificada)
            
            // Pasar la informacion al ViewController por medio del delegado
            let listaVideos = dataDecodificada.videos
            // Se le asigna los videos al delegado, para que la vista los consuma
            delegado?.mostrarVideos(listaVideos: listaVideos)
        } catch {
            print("Error")
        }
    }
    
    func encontrarVideosPopulares(categoria: String) async {
        
        do {
            guard let url = URL(string: "https://api.pexels.com/videos/popular") else {
                print("Error al consultar la API")
                return }
            print(url)
            
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue("BPuUOkpCZlGHv4bo9kU1mepVkcFUFcnG4LxF1bI4dk6iTSkWbR6wcjzU", forHTTPHeaderField: "Authorization")
            let (data, respuesta) = try await URLSession.shared.data(for: urlRequest)
            
            guard (respuesta as? HTTPURLResponse)?.statusCode == 200 else { return }
            
            let dataDecodificada = try JSONDecoder().decode(PopularVideosModel.self, from: data)
            
            
            //Devolverla al ViewController
            let listaVideos = dataDecodificada.videos
            delegadoPopular?.mostrarVideos(listaVideos: listaVideos)
            
        } catch {
            print("Error, \(error.localizedDescription)")
        }
    }
}
