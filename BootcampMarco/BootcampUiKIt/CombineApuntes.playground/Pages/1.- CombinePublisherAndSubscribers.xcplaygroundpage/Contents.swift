import UIKit
import Combine

/*
let myArray = ["1", "2", "3", "4",]
// Indico que myArray sera mi publicador
let myPublisher = myArray.publisher

// ** Primer forma de subscribirse a un publicador
myPublisher.sink { isFinished in
    // Imprime todo el array completo
    print("Is Finished: \(isFinished)")
    
} receiveValue: { value in
    // Imprime cada valor del array
    print("Value Received: \(value)")
}
*/

class TestCombine {
    var numberOfSubscribers: Int = 0
}

// ** Segunda forma de subscribirse a un publicador
let justInteger = Just(2222)
let swiftBetaChanel = TestCombine()
justInteger.assign(to: \TestCombine.numberOfSubscribers, on: swiftBetaChanel)
print(justInteger)
// Just<Int>(output: 2222)
swiftBetaChanel.numberOfSubscribers

