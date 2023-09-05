//
//  MenuDesplegableApp.swift
//  MenuDesplegable
//
//  Created by ALAN CARO on 05/09/23.
//

import SwiftUI

@main
struct MenuDesplegableApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(mainInformation: MainInformation(category: .breakfast))
        }
    }
}
