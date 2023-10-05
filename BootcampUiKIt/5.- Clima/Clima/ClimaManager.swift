//
//  ClimaManager.swift
//  Clima
//
//  Created by HEBER JIMENEZ on 04/10/23.
//
// https://api.openweathermap.org/data/2.5/weather?appid=698cb29c0a1e70d1a30a0a9982f6a95a&units=metric&long=es&q=brasil

// Link a revisar
// https://fluffy.es/3-ways-to-pass-data-between-view-controllers/


import Foundation

/// Patron Delegation
// 1.- Se crea el Protocolo
protocol ClimaManagerDelegate {
    
    // Metodos que el VIewController que lo adopte, debera implementar
    func actualizarClima(clima: ClimaModelo)
    func existeError(cualError: String)
}

struct ClimaManager {
    
    // Creacion de Delegado
    // Permite guardar la infomacion, para posteriormente enviarla al ViewController
    var delegado: ClimaManagerDelegate?
    
    let urlBase: String = "https://api.openweathermap.org/data/2.5/weather?appid=698cb29c0a1e70d1a30a0a9982f6a95a&units=metric&long=es"
    
    func fetchClima(latitud: Double, longitud: Double) {
        let urlString = "\(urlBase)&lat=\(latitud)&lon=\(longitud)"
        
        realizarSolicitud(url: urlString)
    }
    
    func fetchClima(nombrePais: String) {
        
        realizarSolicitud(url: "\(urlBase)&q=\(nombrePais)")
    }
    
    func realizarSolicitud(url: String) {
        
        // 1.- Crear un objetoURL
        if let url = URL(string: url) {
            
            // 2.- Crear una sesion
            let session = URLSession(configuration: .default)
            
            // 3.- Asignar una tarea a la sesion
            let task = session.dataTask(with: url) { data, response, error in
                // Se recuperan los opcionales
                if let res = response {
                    print("Respuesta: \(res)")
                }
                
                if error != nil {
                    print("Error en la tarea de la API")
                }
                
                if let datos = data {
                    //print("Data: \(datos)")
                    if let clima = self.parseJSON(climaData: datos) {
                        
                        // 2.- Ejecutar funcion para pasar informacion
                        delegado?.actualizarClima(clima: clima)
                    }
                }
            }
            
            // 4.- Comenzar la tarea
            task.resume()
        }
    }
    
    func parseJSON(climaData: Data) -> ClimaModelo? {
        let decodificador = JSONDecoder()
        
        do {
            
            let dataDecodificada = try decodificador.decode(ClimaData.self,from: climaData)
            
            // Aqui es donde se decodifica la informacion obtenida de la api, y se tratan los datos,
            // para que la vista reciba informacion amgable con ella
            let objetoClima = ClimaModelo(condicionId: dataDecodificada.weather[0].id,
                                          nombreCiudad: dataDecodificada.name,
                                          descripcionClima: dataDecodificada.weather[0].description,
                                          temperaturaCelsius: dataDecodificada.main.temp)
            
            return objetoClima
            
            //print("dataDecodificada: \(dataDecodificada)")
        } catch {
            print("Error al decodificar la data \(error.localizedDescription)")
            return nil
        }
    }
}
