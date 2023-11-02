//
//  StoreHomeViewModel.swift
//  6202_StoreApp_MVVM
//
//  Created by Dragon on 10/01/23.
//

import Foundation
import Combine

protocol StoreHomeView: AnyObject {
    
    /// Todas las frutas actualizadas
    func fruits(fruitsUptated fruits: [FruitEntity])
    
    /// La fruta seleccionada
    func fruits(fruitSelected fruit: FruitEntity)
    
}

class StoreHomeViewModel {
    
    // ESCUCHA
    //var modelSubscriber: AnyCancellable?
    weak var fruitsSubscriber: AnyCancellable?
    weak var fruitSelectedSubscriber: AnyCancellable?
    
    // COMUNICA
    weak var view: StoreHomeView?
    
    weak var currentSelectedFruit: FruitEntity?
    
    init() {
        
        // Subscripcion al publicador "fruits"
        self.fruitsSubscriber = StoreModel.shared.$fruits.sink { fruits in
            // Se pasa la informacion al ViewController
            self.view?.fruits(fruitsUptated: fruits)
        }
        
        // Subscripcion al publicador "fruitSelectedSubscriber"
        self.fruitSelectedSubscriber = StoreModel.shared.$selectedFruit.sink { selectedFruit in
            if let selectedFruit = selectedFruit {
                self.view?.fruits(fruitSelected: selectedFruit)
            }
        }
    }
    
    deinit {
        // Se libera memoria 
        print("ELIMINANDO StoreHomeViewModel")
        self.fruitsSubscriber?.cancel()
        self.fruitsSubscriber = nil
        self.fruitSelectedSubscriber?.cancel()
        self.fruitSelectedSubscriber = nil
        self.view = nil
    }
    
    func getFruits() {
        self.view?.fruits(fruitsUptated: StoreModel.shared.fruits)
    }
    
    // INTERACTUA
    func selectFruit(index: Int) {
        StoreModel.shared.selectFruit(index: index)
    }
    
}
