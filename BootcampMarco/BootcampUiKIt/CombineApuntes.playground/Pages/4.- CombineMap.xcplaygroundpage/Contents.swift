import Foundation
import Combine

let inPublisher = PassthroughSubject<Int, Never>()

// UTILIZANDO OPERADOR MAP
/// Este operador pemrite convertir a un valor de tipo A, a un valor de tipo B
/// En este caso, se utiliza map para convertir in valor de tipo int a uno de tipo string
inPublisher.map {valueInt in
    String(valueInt)
}.sink { valueString in
    print("Value: \(valueString)")
}

inPublisher.send(10)
inPublisher.send(20)

