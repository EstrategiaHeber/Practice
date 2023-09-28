//
//  AnimationView.swift
//  TextExample
//
//  Created by HEBER JIMENEZ on 18/09/23.
//
// https://www.youtube.com/watch?v=0WY-wrW2_bs&list=PLwvDm4VfkdphqETTBf-DdjCoAvhai1QpO&index=26&ab_channel=SwiftfulThinking

import SwiftUI

struct AnimationView: View {
    
    @State var isAnimated : Bool = false
    
    var body: some View {
        VStack {
            Button("ButtonAnimation") {
                
//                *4
//                withAnimation(.default) {
//                    isAnimated.toggle()
//                }
                
//                *5
                withAnimation (
                    Animation
                        .default
                        .repeatCount(10, autoreverses: true)
                ) {
                    isAnimated.toggle()
                }
            }
            Spacer()
//            *1
//            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
//                .fill(isAnimated ? Color.red : Color.green)
//                .frame(width: 300, height: 300)
            
//            *2
//            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
//                .fill(isAnimated ? Color.red : Color.green)
//                .frame(
//                    width: isAnimated ? 100 : 300,
//                    height: isAnimated ? 100 : 300)
//                .offset(y: isAnimated ? 300 : 0)
            
//            *3
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? Color.red : Color.green)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 : 300)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 300 : 0)
            Spacer()
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
