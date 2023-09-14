//
//  ContentView.swift
//  EnviarWhats
//
//  Created by ALAN CARO on 07/09/23.
//

import SwiftUI

struct ContentView: View {
    let phoneNumber = "5574037347" // Número de teléfono al que quieres enviar un mensaje
    let message = "Hola, ¿cómo estás?" // Mensaje predeterminado (opcional)

    var body: some View {
        Button(action: {
            openWhatsApp()
        }) {
            Text("Tengo problemas para hacer uso de la aplicacion, ")
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }

    private func openWhatsApp() {
        // Crear una URL con el esquema de WhatsApp
        let whatsappURL = URL(string: "https://wa.me/\(phoneNumber)?text=\(message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")")

        if let url = whatsappURL, UIApplication.shared.canOpenURL(url) {
            // Abre WhatsApp si está instalado
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            // Manejar el caso en que WhatsApp no está instalado o la URL es inválida
            // Puedes mostrar un mensaje de error al usuario o tomar una acción alternativa.
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

