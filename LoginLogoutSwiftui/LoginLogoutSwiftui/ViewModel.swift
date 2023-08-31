//
//  ViewModel.swift
//  LoginLogoutSwiftui
//
//  Created by ALAN CARO on 23/08/23.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var isLoggedIn = false
    
    private let validUser = User(username: "admin", password: "password")
    
    func login() {
        if username == validUser.username && password == validUser.password {
            isLoggedIn = true
        } else {
            isLoggedIn = false
        }
    }
}
