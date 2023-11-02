//
//  GradientsView.swift
//  TextExample
//
//  Created by HEBER JIMENEZ on 12/09/23.
//

import SwiftUI

struct GradientsView: View {
    var body: some View {
        ScrollView {
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    
                    LinearGradient(gradient:
                                    Gradient(colors: [Color.red, Color.red.opacity(0.8), Color.red.opacity(0.6), Color.red.opacity(0.4), Color.red.opacity(0.2)]),
                                   startPoint: .leading,
                                   endPoint: .trailing)
                )
                .frame(height: 200)
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    
                    LinearGradient(gradient:
                                    Gradient(colors: [Color.red, Color.blue]),
                                   startPoint: .leading,
                                   endPoint: .trailing)
                )
                .frame(height: 200)
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    
                    LinearGradient(gradient:
                                    Gradient(colors: [Color.red, Color.blue]),
                                   startPoint: .trailing,
                                   endPoint: .leading)
                )
                .frame(height: 200)
            
           RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    
                    LinearGradient(gradient:
                                    Gradient(colors: [Color.red, Color.blue]),
                                   startPoint: .top,
                                   endPoint: .bottom)
                )
                .frame(height: 200)
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    
                    LinearGradient(gradient:
                                    Gradient(colors: [Color.red, Color.blue, Color.orange, Color.purple]),
                                   startPoint: .topLeading,
                                   endPoint: .bottom)
                )
                .frame(height: 200)
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    
                    RadialGradient(
                        gradient: Gradient(colors: [Color.red, Color.blue]),
                        center: .center,
                        startRadius: 5,
                        endRadius: 300)
                )
                .frame(height: 200)
            
            AngularGradient(
                gradient: Gradient(colors: [Color.red, Color.blue]),
                center: .center,
                angle: .degrees(90)
            )
            .frame(height: 200)
            
            AngularGradient(
                gradient: Gradient(colors: [Color.red, Color.blue]),
                center: .center,
                angle: .degrees(180)
            )
            .frame(height: 200)
            
            AngularGradient(
                gradient: Gradient(colors: [Color.red, Color.blue]),
                center: .center,
                angle: .degrees(180 + 45)
            )
            .frame(height: 200)
        }
        .padding(.leading, 5)
        .padding(.trailing, 5)
    }
}

struct GradientsView_Previews: PreviewProvider {
    static var previews: some View {
        GradientsView()
    }
}
