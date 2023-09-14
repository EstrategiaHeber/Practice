//
//  FramesAlignmentView.swift
//  TextExample
//
//  Created by HEBER JIMENEZ on 13/09/23.
//

import SwiftUI

struct FramesAlignmentView: View {
    var body: some View {
        
        VStack {
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .background(Color.green)
                .frame(width: 200, height: 200, alignment: .center)
                .background(Color.red)
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .background(Color.green)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.red)
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .background(Color.green)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.red)
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .background(Color.green)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(Color.red)
        }
    }
}

struct FramesAlignmentView_Previews: PreviewProvider {
    static var previews: some View {
        FramesAlignmentView()
    }
}
