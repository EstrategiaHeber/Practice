//
//  ApiClientModel.swift
//  MVVM_Combine_UIKIT
//
//  Created by ALAN CARO on 20/10/23.
//
// Simulara una peticion http con alguna url

import Foundation

// MARK: - ERRORES
enum BackendError: String, Error {
    case invalidEmail = "Comprueba tu email"
    case invalidPassword = "Comprueba tu password"
}

// MARK: - PETICION A API
final class ApiClient {
    
    func login(withEmail email: String, password: String) async throws {
        
        // Simula peticion http que dura 2 segundos
        try await Task.sleep(nanoseconds: NSEC_PER_SEC * 2)
    }
}

// MARK: - BACKEND
func simulateBackendLogin(email: String, password: String) throws  -> UserModel {
    
    guard email == "test.hj@gmail.com" else {
        print("El user no es correcto")
        throw BackendError.invalidEmail
    }
    
    guard password == "1234567890" else {
        print("El password no es correcto")
        throw BackendError.invalidPassword
    }
    
    print("Success")
    return .init(name: "Heber", token: "token_1234", sessionStar: .now)
}
