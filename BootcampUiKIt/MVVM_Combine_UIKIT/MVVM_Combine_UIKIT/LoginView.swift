//
//  ViewController.swift
//  MVVM_Combine_UIKIT
//
//  Created by HEBER JIMENEZ on 20/10/23.
//

import UIKit
import Combine

class LoginView: UIViewController {
    
    private let loginViewModel = LoginViewModel(apiClient: ApiClient())
    
    private let emailTextField: UITextField = {
        
        let textField = UITextField()
        textField.placeholder = "Ingresa email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
    }()
    
    private let passwordTextField: UITextField = {
       
        let textfield = UITextField()
        textfield.placeholder = "Ingresa el password"
        textfield.borderStyle = .roundedRect
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
        
    }()
    
    private lazy var loginButton: UIButton = {
        
        var configuracion = UIButton.Configuration.filled()
        configuracion.title = "Login"
        configuracion.subtitle = "Subtitulo"
        configuracion.image = UIImage(systemName: "play.circle.fill")
        configuracion.imagePadding = 8
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: {  action in
            self.startLogin()
        }))
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = configuracion
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Se agregan las vistas
        [emailTextField, passwordTextField, loginButton].forEach(view.addSubview)
        
        // Se agregan los constraints
        NSLayoutConstraint.activate([
            
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -20),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            passwordTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -20),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func startLogin() {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {return}
        
        loginViewModel.userLogin(withEmail: email.lowercased(),
                                 password: password.lowercased())
    }
    
    func createBindinViewWithViewModel() {
        
    }
}

//extension UITextField {
//    var textPublisher: AnyPublisher<String, Never>
//    return 
//}

