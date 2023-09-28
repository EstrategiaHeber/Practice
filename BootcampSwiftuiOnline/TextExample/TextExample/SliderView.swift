//
//  SliderView.swift
//  TextExample
//
//  Created by ALAN CARO on 22/09/23.
//

import SwiftUI

struct SliderView: View {
    
    @State var slideValue: Double = 0.0
    @State var color: Color = .red
    
    var body: some View {
        
        VStack {
            
            Text("RATING")
            Text(String(format: "%.2f", slideValue))
            //Slider(value: $slideValue)
            //Slider(value: $slideValue, in: 1...10)
            //Slider(value: $slideValue, in: 1...10, step: 1)
                .accentColor(.red)
            Slider(
                value: $slideValue,
                in: 1...5,
                step: 1.0,
                onEditingChanged: {(_) in
                    color = .yellow
                },
                minimumValueLabel: 
                    Text("1")
                    .font(.largeTitle)
                    .foregroundColor(.orange),
                maximumValueLabel: 
                    Text("5")
                    .font(.largeTitle)
                    .foregroundColor(.orange),
                label: {
                    Text("Title")
                })
            .accentColor(.red)
        }
        .padding()
    }
}

#Preview {
    SliderView()
}
