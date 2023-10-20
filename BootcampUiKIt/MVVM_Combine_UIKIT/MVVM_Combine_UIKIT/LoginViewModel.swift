//
//  LoginViewModel.swift
//  MVVM_Combine_UIKIT
//
//  Created by HEBER JIMENEZ on 20/10/23.
//

import Foundation
import Combine

class LoginViewModel {
    
    // Publicadores que notificaran de actualizaciones a las vistas
    @Published var email = ""
    @Published var password = ""
    
    // Guarda referencia de cuando se subscribe a los notificadores
    var cancellables = Set<AnyCancellable>()
    
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
        
        formValidation()
    }
    
    func formValidation() {
        // Se subscribe al notificador email
        $email.sink { valor in
            print("Email: \(valor)")
        }.store(in: &cancellables)
        
        $password.sink { valor in
            print("password: \(valor)")
        }.store(in: &cancellables)
    }
    
    @MainActor // Ejecuta en el hilo principal
    func userLogin(withEmail email: String, password: String) {
        
        Task {
            do {
                let userModel = try await apiClient.login(withEmail: email, password: password)
            } catch let error as BackendError {
                print(error.localizedDescription)
            }
        }
    }
}
