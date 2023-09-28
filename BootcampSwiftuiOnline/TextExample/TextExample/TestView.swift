//
//  TestView.swift
//  TextExample
//
//  Created by ALAN CARO on 21/09/23.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("Página 1")) {
                    Label("Página 1", systemImage: "house")
                }
                NavigationLink(destination: Text("Página 2")) {
                    Label("Página 2", systemImage: "star")
                }
                NavigationLink(destination: Text("Página 3")) {
                    Label("Página 3", systemImage: "gear")
                }
            }
            .listStyle(SidebarListStyle()) // Aplica un estilo de lista de barra lateral
            .frame(minWidth: 150, idealWidth: 200, maxWidth: 250) // Ancho del sidebar
            .navigationTitle("Sidebar")
            
            Text("Contenido Principal")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
