// Este operador te permite enviar erroes, en este caso cuando no puede transformar de string a int, arroja un error, y en automatico ya no envia mas publicaciones.

import Foundation
import Combine

enum SwiftBetaError: Error {
    case errorStringToInt
}

func mapStringToInt(with stringValue: String) throws -> Int {
    
    guard let result = Int(stringValue) else {
        throw SwiftBetaError.errorStringToInt
    }
    return result
}

let stringPublisher = PassthroughSubject<String, SwiftBetaError>()

stringPublisher
    .tryMap{ valueString in
        try mapStringToInt(with: valueString)
    }
    .sink { finished in
    print("Comlpeted: \(finished)")
} receiveValue: { value in
    print("Value: \(value)")
}

// Este valor de envia
stringPublisher.send("30")
// Este ya no se puede transformar y arroja un error
stringPublisher.send("Hola")
// Este valor ya no se envia porque se detuvo por enviar el error pasado
stringPublisher.send("40")
