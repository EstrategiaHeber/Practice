//
//  ContentView.swift
//  NavigatinLinkAction
//
//  Created by ALAN CARO on 05/09/23.
//

import SwiftUI

struct ContentView: View {

    @State var showView1 = false
    @State var showView2 = false

    var body: some View {

        NavigationStack {

            VStack(spacing: 16) {

                // Boton para navegar a vista HolaView
                Button {
                    showView1 = true
                    print("Quiero ir a View1")
                } label: {
                    Text("Ir a View1")
                }

                // Boton para navegar a vista HelloView
                Button {
                    showView2 = true
                    print("Quiero ir a View2")
                } label: {
                    Text("Ir a View2")
                }
            }
            .navigationDestination(isPresented: $showView1) {
                View1()
            }
            .navigationDestination(isPresented: $showView2) {
                View2()
            }
        }
    }
}

struct View1: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Vista 1")
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
    
    var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack(spacing: 0) {
                Image(systemName: "arrow.left")
                //Text("Volver")
            }
        }
    }
}

struct View2: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Vista 2")
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
    
    var backButton: some View {
        
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack(spacing: 0) {
                Image(systemName: "arrow.left")
                //Text("Volver")
            }
        }
    }
}

//struct ContentView: View {
//    @State private var selectedDestination: Destination?
//
//    var body: some View {
//        NavigationView {
//            List {
//                Button("Elemento 1") {
//                    selectedDestination = .detail1
//                }
//                Button("Elemento 2") {
//                    selectedDestination = .detail2
//                }
//                Button("Elemento 3") {
//                    selectedDestination = .detail3
//                }
//            }
//            .navigationDestination(for: Destination.self) { destination in
//                switch destination {
//                case .detail1:
//                    DetailView(title: "Detalle del Elemento 1")
//                case .detail2:
//                    DetailView(title: "Detalle del Elemento 2")
//                case .detail3:
//                    DetailView(title: "Detalle del Elemento 3")
//                }
//            }
//        }
//    }
//}
//
//enum Destination: Hashable {
//    case detail1
//    case detail2
//    case detail3
//}
//
//struct DetailView: View {
//    let title: String
//
//    var body: some View {
//        Text(title)
//            .navigationBarTitle(title)
//    }
//}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

