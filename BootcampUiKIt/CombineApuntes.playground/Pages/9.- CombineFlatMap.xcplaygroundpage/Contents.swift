import Foundation
import Combine

struct User {
    let email: String
    let name: String
}

let user: User = .init(email: "test@gmail.com",
                       name: "testName")

enum RegisterFormError: String, Error {
    case userExists = "User already exists"
    case wrongEmail = "Wrong Email"
    case wrongPassword = "Wrong Password"
    case Unknown = "Unknown"
}

func register(user: User) -> AnyPublisher<User, RegisterFormError> {
    if user.email == "test@gmail.com" {
        return Just(user)
            .setFailureType(to: RegisterFormError.self)
            .eraseToAnyPublisher()
    } else {
        return Fail(error: RegisterFormError.wrongEmail)
            .eraseToAnyPublisher()
    }
}

func save(user: User) -> AnyPublisher<Bool, RegisterFormError> {
    if user.email == "test@gmail.com" {
        return Just(true)
            .setFailureType(to: RegisterFormError.self)
            .eraseToAnyPublisher()
    } else {
        return Fail(error: RegisterFormError.wrongEmail)
            .eraseToAnyPublisher()
    }
}

register(user: user)
    .flatMap { user in
        save(user: user)
    }
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("Error: \(error.localizedDescription)")
        case .finished:
            print("Finished")
        }
    } receiveValue: { value in
        print("Usuario registrado y almacenado en la base de datos. REGISTERED -> \(value)")
    }

