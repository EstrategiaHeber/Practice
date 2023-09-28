//: [Previous](@previous)

// https://www.youtube.com/watch?v=x6tLKWa5BXQ&ab_channel=SwiftBeta
// minuto 22:13

import Foundation
import Combine

struct Weather {
    
    let weatherPubliser = PassthroughSubject<Int, Error>()
    
    func getWeatherInfo() {
        weatherPubliser.send(10)
        
        /// * Esto indica que se ha terminado de publicar lo requerido, y lo que pase despues,
        /// ya no sera escuchado por el subscripto
        //weatherPubliser.send(completion: .finished)
        
        /// * De esta forma se envia un ERROR
        weatherPubliser.send(completion: .failure(URLError(.badURL)))
        weatherPubliser.send(20)
    }
}

let weather = Weather()
weather.weatherPubliser.sink { completion in
    //print("Completion \(completion)")
    
    // De esta manera manejamos si se recibe un error o un finish
    switch completion {
    case .failure(let error):
        print("Error \(error.localizedDescription)")
        
    case .finished:
        print("Finished")
    }
} receiveValue: { value in
    print("Values: \(value)")
}

weather.getWeatherInfo()
