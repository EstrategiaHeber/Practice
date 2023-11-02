//
//  StoreModel.swift
//  6202_StoreApp_MVVM
//
//  Created by Dragon on 10/01/23.
//

import Foundation
import CoreData
import Combine

class StoreModel {
    
    // Singleton
    static let shared = StoreModel()
    
    // Creacion de Base de Datos
    let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "StoreModelApp")
        
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("StoreApp container error: \(error)")
            }
        }
        
        return container
    }()
    
    // Notificadores
    @Published var fruits: [FruitEntity] = []
    @Published var selectedIndex: Int?
    @Published var selectedFruit: FruitEntity?
    
    // Se cargan todas las frutas existentes
    init() {
        self.loadFruits()
    }
    
    // Se libera espacio de memoria
    deinit {
        self.fruits.removeAll()
    }
    
    // Se cargan todas las frutas existentes desde CoreData
    func loadFruits() {
        // Se crea el contexto
        let context = self.container.viewContext
        // Se hace el query para que traiga todo lo existente en la tabla "FruitEntity"
        let request = FruitEntity.fetchRequest()
        
        // Se recupera los elementos
        if let fruits = try? context.fetch(request) {
            // Sealmacenan para hacer la transmision
            self.fruits = fruits.reversed()
        }
    }
    
    func selectFruit(index: Int) {
        
        // Se evalua que existan elementos
        guard index >= 0 && index < self.fruits.count else { return }
        
        self.selectedIndex = index
        // Se indica cual fruta fue seleccionada
        self.selectedFruit = self.fruits[index]
        
    }
    
    func addFruit(name: String, amount: Double) {
        let context = self.container.viewContext
        
        let fruit = FruitEntity(context: context)
        
        fruit.name = name
        fruit.amount = amount
        
        do {
            try context.save()
            self.loadFruits()
        } catch {
            context.rollback()
        }
    }
    
    func updateFruit(name: String?, amount: Double?) {
        
        if let selectedFruit = self.selectedFruit {
            if let name = name {
                selectedFruit.name = name
            }
            
            if let amount = amount {
                selectedFruit.amount = amount
            }
            
            let context = container.viewContext
            
            do {
                try context.save()
                self.loadFruits()
            } catch {
                context.rollback()
            }
        }
        
    }
    
    func deleteFruit() {
        
        if let selectedIndex = selectedIndex {
            self.fruits.remove(at: selectedIndex)
            self.selectedIndex = nil
            self.selectedFruit = nil
            self.loadFruits()
        }
        
    }
    
}
