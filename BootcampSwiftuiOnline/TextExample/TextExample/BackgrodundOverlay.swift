//
//  BackgrodundOverlay.swift
//  TextExample
//
//  Created by HEBER JIMENEZ on 13/09/23.
//
// https://www.youtube.com/watch?v=FQdGt24LMRs&list=PLwvDm4VfkdphqETTBf-DdjCoAvhai1QpO&index=10&ab_channel=SwiftfulThinking

import SwiftUI

struct BackgrodundOverlay: View {
    var body: some View {
        
//        ScrollView {
//
//            VStack(spacing: 60) {
//
//                Text("Hello World!")
//                    .frame(width: 100, height: 100, alignment: .center)
//                    .background(
//                        Circle()
//                            .fill(Color.gray)
//                    )
//                    .frame(width: 110, height: 110, alignment: .center)
//                    .background(
//                        Circle()
//                            .fill(Color.red)
//                    )
//
//                Text("Hello World!")
//                    .background(
//                        Circle()
//                            .fill(Color.green)
//                            .frame(width: 100, height: 100, alignment: .center)
//                    )
//                    .background(
//                        Circle()
//                            .fill(Color.blue)
//                            .frame(width: 110, height: 110, alignment: .center)
//                    )
//
//                Circle()
//                    .fill(Color.yellow)
//                    .frame(width: 100, height: 100)
//                    .overlay(
//                        Text("1")
//                            .font(.largeTitle)
//                            .foregroundColor(.white)
//                    )
//                    .background(
//                        Circle()
//                            .fill(Color.black)
//                            .frame(width: 110, height: 110)
//                    )
//
//                Practice1()
//
//                Practice2()
//            }
//        }
        
        Practice2()
    }
}

struct Practice1: View {
    var body: some View {
        Rectangle()
            .frame(width: 100, height: 100)
            .overlay(
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 50, height: 50, alignment: .topLeading)
            )
            .background(
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 150, height: 150, alignment: .bottomTrailing)
            )
    }
}

struct Practice2: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(Color.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.yellow, Color.blue]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                    .shadow(color: Color.black, radius: 10, x: 0.0, y: 10)
                    .overlay(
                        Text("5")
                            .font(.headline)
                            .foregroundColor(.white)
                    )
                , alignment: .bottomTrailing
            )
    }
}

struct BackgrodundOverlay_Previews: PreviewProvider {
    static var previews: some View {
        BackgrodundOverlay()
    }
}
