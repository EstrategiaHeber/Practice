//
//  ImagenesView.swift
//  TextExample
//
//  Created by HEBER JIMENEZ on 13/09/23.
//

import SwiftUI

struct ImagenesView: View {
    var body: some View {
        ScrollView {
            
            Image("call_whiteblue")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 200)
            
            Image("call_whiteblue")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 200)
            
            Image("call_whiteblue")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
            
            Image("call_whiteblue")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
            
            Image("call_whiteblue")
                .resizable()
                .scaledToFit()
                .clipped()
                .cornerRadius(150)
                .frame(width: 200, height: 200)
            
            Image("call_whiteblue")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 200, height: 200)
        }
    }
}

struct ImagenesView_Previews: PreviewProvider {
    static var previews: some View {
        ImagenesView()
    }
}
