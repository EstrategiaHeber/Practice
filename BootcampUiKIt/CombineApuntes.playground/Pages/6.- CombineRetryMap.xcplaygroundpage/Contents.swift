// Este operador nos permite recuperarnos de el envio de un error

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
    // Permite recuperarse 1 vez de un error
    .retry(3)
    .sink { finished in
    print("Comlpeted: \(finished)")
} receiveValue: { value in
    print("Value: \(value)")
}

stringPublisher.send("Hola")
stringPublisher.send("30")
stringPublisher.send("Hello")
stringPublisher.send("Hi")
stringPublisher.send("40")
