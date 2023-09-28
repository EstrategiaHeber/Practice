//
//  ContentView.swift
//  PickerView
//
//  Created by ALAN CARO on 14/09/23.
//

import SwiftUI

struct ContentView: View {
//    @State private var selectedOption = "Opción 1"
//    @State private var selectedDirection = "Left"
//    @State private var selectedFont = Font.system(.body)
//
//    @State private var isPickerDisabled = false
    
    @State private var selection = "HotDeals"

    var body: some View {
        
        Picker("Select recipe component", selection: $selection) {
            Text("HotDeals").tag("HotDeals") // Selection.hotDeals
            Text("Directorio").tag("Directorio") // Selection.directorio
            Text("Maps").tag("Maps") // Selection.maps
        }
        .pickerStyle(SegmentedPickerStyle())
//        VStack {
//
//            // 1
//            Picker("Selecciona una opción", selection: $selectedOption) {
//                Text("Opción 1").tag("Opción 1")
//                Text("Opción 2").tag("Opción 2")
//            }
//            .pickerStyle(.segmented)
//
//            // 2
//            Picker("Selecciona una dirección", selection: $selectedDirection) {
//                        Text("Izquierda").tag("Left")
//                        Text("Centro").tag("Center")
//                        Text("Derecha").tag("Right")
//                    }
//                    .labelsHidden() // Oculta las etiquetas
//                    .pickerStyle(.wheel)
//
//            // 3
//            Picker("Selecciona un tipo de fuente", selection: $selectedFont) {
//                        Text("Arial").tag(Font.system(.body))
//                        Text("Helvetica").tag(Font.custom("Helvetica", size: 18))
//                    }
//                    .pickerStyle(.wheel)
//                    .labelStyle(.titleAndIcon)
//
//            // 4
//            Picker("Selecciona una opción", selection: $selectedOption) {
//                        Text("Opción 1").tag("Opción 1")
//                        Text("Opción 2").tag("Opción 2")
//                    }
//                    .disabled(isPickerDisabled)
//
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
