//
//  ColorView.swift
//  TextExample
//
//  Created by HEBER JIMENEZ on 12/09/23.
//

import SwiftUI

struct ColorView: View {
    var body: some View {
        VStack(spacing: 40) {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    //Color.red
                    Color("CustomColor")
                )
                .frame(width: 300, height: 200)
                .shadow(color: Color.yellow, radius: 10, x: -10, y: -10)
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    //Color.red
                    Color("CustomColor")
                )
                .frame(width: 300, height: 200)
                .shadow(color: Color("CustomColor").opacity(0.3), radius: 10, x: -20, y: -20)
        }
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView()
    }
}
