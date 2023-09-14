//
//  IconsView.swift
//  TextExample
//
//  Created by HEBER JIMENEZ on 13/09/23.
//

import SwiftUI

struct IconsView: View {
    
    var body: some View {
        
        ScrollView {
            Image(systemName: "person.fill")
                .font(.caption)
                .background(Color.gray)
            
            Image(systemName: "person.fill")
                .font(.system(size: 200))
                .background(Color.gray)
            
            Image(systemName: "person.fill")
                .background(Color.yellow)
                .foregroundColor(Color("CustomColor"))
                .frame(width: 200, height: 200)
                .background(Color.gray)
            
            Image(systemName: "person.fill")
                .resizable()
                .foregroundColor(Color("CustomColor"))
                .frame(width: 200, height: 200)
                .background(Color.gray)
            
            Image(systemName: "person.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color("CustomColor"))
                .frame(width: 200, height: 200)
                .background(Color.gray)
            
            Image(systemName: "person.fill")
                .resizable()
                //.scaledToFit()
                .scaledToFill()
                .foregroundColor(Color("CustomColor"))
                .frame(width: 200, height: 200)
                .background(Color.gray)
            
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFill()
                .foregroundColor(Color("CustomColor"))
                .frame(width: 200, height: 200)
                .background(Color.gray)
                .clipped()
            
            Image(systemName: "person.fill")
                .resizable()
                .font(.largeTitle)
                .frame(width: 200, height: 200)
        }
    }
}

struct IconsView_Previews: PreviewProvider {
    static var previews: some View {
        IconsView()
    }
}
