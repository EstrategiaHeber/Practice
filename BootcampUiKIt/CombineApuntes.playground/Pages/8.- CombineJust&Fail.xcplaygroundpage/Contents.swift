import Foundation
import Combine

struct User {
    let email: String
    let name: String
}

let user: User = .init(email: "test@gmail.com",
                       name: "testName")

// PUBLICADOR (JUST)
let justPublisher = Just(user)

// SUBSCRIPTOR (JUST)
/*justPublisher.sink { completion in
    switch completion {
    case .failure(let error):
        print("Error \(error.localizedDescription)")
    case .finished:
        print("FInished")
    }
} receiveValue: { user in
    print("User: \(user)")
}*/

func register(user: User) -> AnyPublisher<User, RegisterFormError> {
    if user.email == "test@gmail.com" {
        return Just(user)
            .setFailureType(to: RegisterFormError.self)
            .eraseToAnyPublisher()
    } else {
        return Fail(error: RegisterFormError.wrongEmail)
    }
}

let cancellable = register(user: user)
    .sink { completion in
        switch completion {
        case .failure(let error):
            print("Error \(error.localizedDescription)")
        case .finished:
            print("FInished")
        }
    } receiveValue: { user in
        print("User: \(user)")
    }


enum RegisterFormError: String, Error {
    case userExists = "User already exists"
    case wrongEmail = "Wrong Email"
    case wrongPassword = "Wrong Password"
    case Unknown = "Unknown"
}

// PUBLICADOR (FAIL)
let failPublisher = Fail<Any, RegisterFormError>(error: RegisterFormError.Unknown)

// SUBSCRIPTOR (FAIL)
failPublisher.sink { completion in
    switch completion {
    case .failure(let error):
        print("Error \(error.localizedDescription)")
    case .finished:
        print("FInished")
    }
} receiveValue: { user in
    print("User: \(user)")
}

