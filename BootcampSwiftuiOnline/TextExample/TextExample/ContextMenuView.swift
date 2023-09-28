//
//  ContextMenuView.swift
//  TextExample
//
//  Created by HEBER JIMENEZ on 22/09/23.
//
// https://www.youtube.com/watch?v=3jjQ6WASGIw&list=PLwvDm4VfkdphqETTBf-DdjCoAvhai1QpO&index=35&ab_channel=SwiftfulThinking

import SwiftUI

struct ContextMenuView: View {
    
    @State var backgroundColor: Color = .black
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10.0) {
            
            Image(systemName: "house.fill")
                .font(.title)
            Text("Swiftui Thinking")
                .font(.headline)
            Text("How to use Context Menu")
                .font(.subheadline)
            
        }
        .foregroundColor(.white)
        .padding(30)
        .background(backgroundColor).cornerRadius(30)
        .contextMenu{
            Button(action: {
                backgroundColor = .yellow
            }, label: {
                Label("Share Post", systemImage: "flame.fill")
            })
            
            Button(action: {
                backgroundColor = .red
            }, label: {
                Text("Report Post")
            })
            
            Button(action: {
                backgroundColor = .green
            }, label: {
                Label("Like Post", systemImage: "heart.fill")
            })
        }
    }
}

#Preview {
    ContextMenuView()
}
