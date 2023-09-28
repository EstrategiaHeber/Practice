//
//  ContentView.swift
//  RetoAleatorio
//
//  Created by ALAN CARO on 18/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numerosDisponiblesHeber = Set(1...300)
    @State private var numerosDisponiblesNataly = Set(1...50)
    @State private var numeroAleatorioNataly: Int?
    @State private var numeroAleatorioHeber: Int?

    var body: some View {
        VStack {
            VStack {
                if let numero = numeroAleatorioNataly {
                    Text("Número aleatorio únicoNataly: \(numero)")
                } else {
                    Text("Todos los números se han utilizado.")
                }

                Button("Generar Número") {
                    generarNumeroAleatorioUnicoNataly()
                }
            }
            
//            VStack {
//                if let numero = numeroAleatorioHeber {
//                    Text("Número aleatorio únicoHeber: \(numero)")
//                } else {
//                    Text("Todos los números se han utilizado.")
//                }
//
//                Button("Generar Número") {
//                    generarNumeroAleatorioUnicoHeber()
//                }
//            }
        }
        .onAppear {
            //generarNumeroAleatorioUnico()
            numeroAleatorioNataly = nil
            numeroAleatorioHeber = nil
        }
        .padding()
    }

    private func generarNumeroAleatorioUnicoHeber() {
        if !numerosDisponiblesHeber.isEmpty {
            let indice = numerosDisponiblesHeber.index(numerosDisponiblesHeber.startIndex, offsetBy: Int.random(in: 0..<numerosDisponiblesHeber.count))
            numeroAleatorioHeber = numerosDisponiblesHeber.remove(at: indice)
        } else {
            numeroAleatorioHeber = nil
        }
    }
    
    private func generarNumeroAleatorioUnicoNataly() {
        if !numerosDisponiblesNataly.isEmpty {
            let indice = numerosDisponiblesNataly.index(numerosDisponiblesNataly.startIndex, offsetBy: Int.random(in: 0..<numerosDisponiblesNataly.count))
            numeroAleatorioNataly = numerosDisponiblesNataly.remove(at: indice)
        } else {
            numeroAleatorioNataly = nil
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
