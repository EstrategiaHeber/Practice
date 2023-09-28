// En esta modalidad se puede enviar un valor por defecto, al publisher.

import Foundation
import Combine

struct BotApp {
    
    var onboardingPublisher = CurrentValueSubject<String, Error>("Bienvenido")
    
    func startOnboarding() {
        
        // Primero se publicara este mensaje
        onboardingPublisher.send("Crea una conversación con algún contacto")
        
        // Despues de 2 segundos se publicara este otro mensaje
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            onboardingPublisher.send("Envia un Sticker")
        }
        
        // Y despues de 6 segundos se piblicara este ultimo mensaje
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            onboardingPublisher.send("Activa las notificaciones")
        }
    }
}

let botApp = BotApp()

// Para debuguear el publisher y ver que pasa con el publisher
/*
 let cancellable = botApp.onboardingPublisher.handleEvents(receiveSubscription: { subscription in
    print("1. Subscription Received \(subscription)")
}, receiveOutput: { value in
    print("2. Value Received \(value)")
}, receiveCompletion: { completion in
    print("3. Completion Received \(completion)")
}, receiveCancel: {
    print("4. Cancel Received")
}, receiveRequest: { request in
    print("5. Request Received")
}).sink { completion in
    
    switch completion {
    
    case .failure(let error):
        print("Error \(error.localizedDescription)")
        
    case .finished:
        //print("Finished")
        break
    }
    
} receiveValue: { value in
    
    //print("Values: \(value)")
}
 */

let cancellable = botApp.onboardingPublisher.sink { completion in
    
    switch completion {
    
    case .failure(let error):
        print("Error \(error.localizedDescription)")
        
    case .finished:
        print("Finished")
    }
    
} receiveValue: { value in
    
    print("Values: \(value)")
}

botApp.startOnboarding()
