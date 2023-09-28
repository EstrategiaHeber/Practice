//
//  AnimationCurvesTimingView.swift
//  TextExample
//
//  Created by HEBER JIMENEZ on 21/09/23.
// https://www.youtube.com/watch?v=0H4G3lGnJE0&list=PLwvDm4VfkdphqETTBf-DdjCoAvhai1QpO&index=27&ab_channel=SwiftfulThinking

import SwiftUI

struct AnimationCurvesTimingView: View {
    let timming: Double = 1.0
    @State var isAnimating: Bool = false
    
    var body: some View {
        
        VStack {
            Button("Button"){
                isAnimating.toggle()
//                withAnimation {
//                    self.isAnimating.toggle()
//                }
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.linear(duration: timming), value: isAnimating)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.easeIn(duration: timming), value: isAnimating)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.easeInOut(duration: timming), value: isAnimating)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.easeOut(duration: timming), value: isAnimating)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.spring(
                    response: 0.5,
                    dampingFraction: 0.2,
                    blendDuration: 0.2),
                           value: isAnimating)
//

        }
        .padding()
    }
}

struct AnimationCurvesTimingView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationCurvesTimingView()
    }
}
