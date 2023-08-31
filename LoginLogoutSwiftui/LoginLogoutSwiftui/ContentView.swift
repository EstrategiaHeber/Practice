//
//  ContentView.swift
//  LoginLogoutSwiftui
//
//  Created by ALAN CARO on 23/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                LoginView(viewModel: loginViewModel)
                
                NavigationLink(destination: HomeView(), isActive: $loginViewModel.isLoggedIn) {
                    EmptyView()
                }
                .hidden()
            }
            .navigationTitle("Inicio de sesión")
        }
    }
}



struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State private var showErrorAlert = false
    
    var body: some View {
        VStack {
            TextField("Nombre de usuario", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Contraseña", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Iniciar sesión") {
                viewModel.login()
                
                if viewModel.isLoggedIn {
                    // Navegación a la vista HomeView después del inicio de sesión exitoso
                    NavigationLink(destination: HomeView()) {
                        EmptyView()
                    }
                } else {
                    showErrorAlert = true
                }
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .alert(isPresented: $showErrorAlert) {
            Alert(title: Text("Inicio de sesión fallido"), message: Text("Las credenciales ingresadas son incorrectas."), dismissButton: .default(Text("OK")))
        }
    }
}


struct HomeView: View {
    var body: some View {
        Text("¡Inicio de sesión exitoso!")
            .font(.largeTitle)
            .foregroundColor(.green)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 struct ContentView: View {
     @State private var isLoggedIn = false
     
     var body: some View {
         NavigationView {
             VStack {
                 if isLoggedIn {
                     NavigationStack {
                         HomeView()
                     }
                 } else {
                     LoginView(isLoggedIn: $isLoggedIn)
                 }
             }
             .navigationTitle("Inicio de sesión")
         }
     }
 }

 struct LoginView: View {
     @Binding var isLoggedIn: Bool
     @State private var showAlert = false
     
     var body: some View {
         VStack {
             TextField("Nombre de usuario", text: .constant(""))
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .padding()
             
             SecureField("Contraseña", text: .constant(""))
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .padding()
             
             Button("Iniciar sesión") {
                 isLoggedIn = true
                 showAlert = true
             }
             .padding()
         }
         .padding()
         .alert(isPresented: $showAlert) {
             Alert(title: Text("Inicio de sesión exitoso"), dismissButton: .default(Text("OK")))
         }
     }
 }

 struct HomeView: View {
     var body: some View {
         Text("¡Bienvenido a la pantalla principal!")
             .font(.title)
             .padding()
     }
 }

 */

