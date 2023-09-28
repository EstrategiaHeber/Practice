import Foundation
import Combine

let stringPublisher = PassthroughSubject<String, Never>()

stringPublisher
    .filter { value in value.count > 4}
    .sink { completion in
    print("Completion \(completion)")
} receiveValue: { value in
    print("Values: \(value)")
}

stringPublisher.send("Hola")
stringPublisher.send("Hello")
stringPublisher.send("Hellooooo")
stringPublisher.send("Hi")
