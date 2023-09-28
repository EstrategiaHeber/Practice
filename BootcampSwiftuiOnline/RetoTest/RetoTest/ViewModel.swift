//
//  ViewModel.swift
//  RetoTest
//
//  Created by ALAN CARO on 19/09/23.
//

import Foundation
import CoreData

class ViewModel: ObservableObject {
    
    @Published var numeros: [Int] = []
    @Published var numerosDisponibles: Set<Int> = []
    @Published var numeroAleatorio: Int?
    
    @Published var numeroGuardado: [NumeroTable] = []
    @Published var numDispGuardado: [NumDispTable] = []
    
    // MARK: - CORE DATA
    
    // Creacion de contenedor DB
    let persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "DBReto")
        
        container.loadPersistentStores {
            _, error in
            
            if let error = error {
                
                fatalError("No existe el contenedor \(error)")
            }
        }
        return container
    }()
    
    // MARK: => GUARDAR ELEMENTOS
    
    func guardarNumReto(num: Int) {
        
        let context = self.persistentContainer.viewContext
        
        var elemento = NumeroTable(context: context)
        
        elemento.numero = Int16(num)
        
        do {
            try context.save()
            print("El nuero guardado es: \(num)")
        } catch {
            context.rollback()
        }
    }
    
    func guardarNumDisponibles(num: Int) {
        
        let context = self.persistentContainer.viewContext
        
        var elemento = NumDispTable(context: context)
        
        elemento.numDisp = Int16(num)
        
        do {
            try context.save()
            print("El nuero disponible guardado es: \(num)")
        } catch {
            context.rollback()
        }
    }
    
    
    // MARK: => RECUPERAR ELEMENTOS
    
    func recuperarElementos()  {
        print("Recuperando Numero Guardado")
        
        let context = self.persistentContainer.viewContext
        let requestNumero = NumeroTable.fetchRequest()
        
        if let numeros = try? context.fetch(requestNumero) {
            
            print("Existen \(numeros.count) numeros guardados")
            self.numeroGuardado = numeros
            for i in numeroGuardado {
                print(i.numero)
            }
        }
    }
    
    func recuperarNumDisponible()  {
        print("Recuperando Numero Guardado")
        
        let context = self.persistentContainer.viewContext
        let requestNumero = NumDispTable.fetchRequest()
        
        if let numeros = try? context.fetch(requestNumero) {
            
            print("Existen \(numeros.count) numeros guardados")
            self.numDispGuardado = numeros
            for i in numeroGuardado {
                print(i.numero)
            }
        }
    }
    
    // MARK: => ELIMINAR ELEMENTOS
    
    func eliminarElementos() {
        print("Eliminando")
        let context = self.persistentContainer.viewContext
        
        let requestNumeros = NumeroTable.fetchRequest()
        
        if let numeros = try? context.fetch(requestNumeros){
            
            for num in numeros {
                print("Se va a elimar \(num)")
                context.delete(num)
                print("Se elimino \(num)")
                do {
                    try context.save()
                } catch {
                    context.rollback()
                }
            }
        }
        
        let requestNumDisp = NumDispTable.fetchRequest()
        
        if let numDisp = try? context.fetch(requestNumDisp){
            
            for num in numDisp {
                print("Se va a elimar \(num)")
                context.delete(num)
                print("Se elimino \(num)")
                do {
                    try context.save()
                } catch {
                    context.rollback()
                }
            }
        }
    }
    
    
    // MARK: - METODOS
    
    func generarNumeroAleatorioUnico() {
        
        //recuperarNumDisponible()
        
        if !numerosDisponibles.isEmpty {
            let indice = numerosDisponibles.index(numerosDisponibles.startIndex, offsetBy: Int.random(in: 0..<numerosDisponibles.count))
            numeroAleatorio = numerosDisponibles.remove(at: indice)
            
            // Guardar el numero aleatorio en CoreData
            guardarNumReto(num: numeroAleatorio ?? 0)
            print("Los numeros disponibles son: \(numerosDisponibles)")
            
            // Guardar set de números disponibles en CoreData
            for i in numerosDisponibles {
                guardarNumDisponibles(num: i)
            }
            
        } else {
            numeroAleatorio = nil
        }
    }
    
    // Función para actualizar el conjunto de números disponibles
    func actualizarNumerosDisponibles(limiteInferior: String, limiteSuperior: String) {
        
        numerosDisponibles = Set((Int(limiteInferior) ?? 0)...(Int(limiteSuperior) ?? 0))
    }
    
    func recuperarNumerosDisponibles() {
        recuperarNumDisponible()
    }
}
