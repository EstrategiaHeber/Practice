//
//  AdaptDarkModeView.swift
//  TextExample
//
//  Created by ALAN CARO on 22/09/23.
//

import SwiftUI

struct AdaptDarkModeView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                VStack(spacing: 20) {
                    Text("This color is PRIMARY")
                        .foregroundColor(.primary)
                    Text("This color is SECONDARY")
                        .foregroundColor(.secondary)
                    Text("This color is BLACK")
                        .foregroundColor(.black)
                    Text("This color is WHITE")
                        .foregroundColor(.white)
                    Text("This color is RED")
                        .foregroundColor(.red)
                    Text("This color is GLOBALLY Y ADAPTATIVE")
                    // Metodo 1
                        //.foregroundColor(Color("ColorDarkMode"))
                    
                    // Metodo 2
                        .foregroundColor(colorScheme == .light ? .black : .white)
                    
                }
            }
            .navigationTitle("DARK MODE")
        }
    }
}

#Preview {
    AdaptDarkModeView()
        .preferredColorScheme(.light)
}

#Preview {
    AdaptDarkModeView()
        .preferredColorScheme(.dark)
}

