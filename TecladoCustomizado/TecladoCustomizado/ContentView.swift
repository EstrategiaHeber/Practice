//
//  ContentView.swift
//  TecladoCustomizado
//
//  Created by ALAN CARO on 30/08/23.
//


// MARK: DESAPARECER EL TECLADO Y DARLE UNA FUNCION ESPECIFICA AL BOTON DE "INTO"
//import SwiftUI
//
//struct ContentView: View {
//    @State private var text: String = ""
//
//    var body: some View {
//        VStack {
//            TextField("Enter text", text: $text)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .onSubmit {
//                    handleEnterPress()
//                }
//        }
//        .padding()
//    }
//
//    private func handleEnterPress() {
//        // Realiza alguna acción con el texto ingresado cuando se presiona "Ir" o "Intro"
//        print("Enter pressed with text:", text)
//        hideKeyboard()
//    }
//
//    private func hideKeyboard() {
//        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


// MARK: CUSTOMIZAR EL BOTON DE SIGUIENTE O INTO
//
//import SwiftUI
//import UIKit
//
//struct ContentView: View {
//    @State private var text: String = ""
//
//    var body: some View {
//        VStack {
//            CustomTextField(text: $text)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//        }
//        .padding()
//    }
//}
//
//struct CustomTextField: UIViewRepresentable {
//    @Binding var text: String
//
//    func makeUIView(context: Context) -> UITextField {
//        let textField = UITextField()
//        textField.delegate = context.coordinator
//        return textField
//    }
//
//    func updateUIView(_ uiView: UITextField, context: Context) {
//        uiView.text = text
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject, UITextFieldDelegate {
//        var parent: CustomTextField
//
//        init(_ textField: CustomTextField) {
//            self.parent = textField
//        }
//
//        func textFieldDidChangeSelection(_ textField: UITextField) {
//            parent.text = textField.text ?? ""
//        }
//
//        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//            textField.resignFirstResponder()
//            return true
//        }
//
//        func textFieldDidBeginEditing(_ textField: UITextField) {
//            textField.returnKeyType = .done // Change the button's text to "Done"
//        }
//    }
//}

// MARK: PASAR AL SIGUIENTE TEXTFIELD CON EL BOTON DE "INTO"
//import SwiftUI
//
//struct ContentView: View {
//    @State private var firstName = ""
//    @State private var lastName = ""
//    @FocusState private var focusedField: Field?
//
//    enum Field {
//        case firstName, lastName
//    }
//
//    var body: some View {
//        VStack {
//            TextField("First Name", text: $firstName)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .focused($focusedField, equals: .firstName)
//                .onSubmit {
//                    focusedField = .lastName
//                }
//
//            TextField("Last Name", text: $lastName)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .focused($focusedField, equals: .lastName)
//        }
//        .padding()
//    }
//}


//import SwiftUI
//
//struct ContentView: View {
//    @State private var text: String = ""
//
//    var body: some View {
//        VStack {
//            TextField("Default Style", text: $text)
//                .textFieldStyle(DefaultTextFieldStyle())
//                .padding()
//
//            TextField("Rounded Border Style", text: $text)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//
//            TextField("Plain Style", text: $text)
//                .textFieldStyle(PlainTextFieldStyle())
//                .padding()
//
////            if #available(iOS 15.0, *) {
////                TextField("Inset Style", text: $text)
////                    .textFieldStyle(InsetTextFieldStyle())
////                    .padding()
////            }
//        }
//    }
//}
//
////@available(iOS 15.0, *)
////struct ContentView_Previews: PreviewProvider {
////    static var previews: some View {
////        ContentView()
////    }
////}

// MARK: MODIFICADNO EL BOTON DE AL LADO DE LA BARRA ESPACIADORA
//import SwiftUI
//
//struct ContentView: View {
//
//    @State private var text = ""
//
//    var body: some View {
//
//        VStack {
//
//            TextField("PlaceHolder...", text: $text)
//                .textFieldStyle(DefaultTextFieldStyle())
//                .submitLabel(.route)
//                .onSubmit {
//                    print("Es .route")
//                }
//                .padding()
//
//            TextField("PlaceHolder...", text: $text)
//                .textFieldStyle(.plain)
//                .submitLabel(.next)
//                .onSubmit {
//                    print("Es .next")
//                }
//                .padding()
//
//            TextField("PlaceHolder...", text: $text)
//                .textFieldStyle(.automatic)
//                .submitLabel(.search)
//                .onSubmit {
//                    print("Es .search")
//                }
//                .padding()
//
//            TextField("PlaceHolder...", text: $text)
//                .textFieldStyle(.roundedBorder)
//                .submitLabel(.send)
//                .onSubmit {
//                    print("Es .send")
//                }
//                .padding()
//
//            TextField("PlaceHolder...", text: $text)
//                .submitLabel(.join)
//                .onSubmit {
//                    print("Es .join")
//                }
//                .padding()
//        }
////        .padding()
//    }
//}

import SwiftUI

struct ContentView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @FocusState private var focusedField: Field?

    enum Field {
        case firstName, lastName
    }

    var body: some View {
        VStack {
            
            Image("cintillo 2")
                .resizable()
                .scaledToFit()
            
            TextField("First Name", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .focused($focusedField, equals: .firstName)
                .onTapGesture {
                    focusedField = .firstName
                }
            
            TextField("Last Name", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .focused($focusedField, equals: .lastName)
                .onTapGesture {
                    focusedField = .lastName
                }
        }
//        .frame(maxWidth: .infinity)
//        .padding()
    }
}


