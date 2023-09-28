//
//  TransitionView.swift
//  TextExample
//
//  Created by HEBER JIMENEZ on 21/09/23.
//
// https://www.youtube.com/watch?v=X6FAIa0nJoA&list=PLwvDm4VfkdphqETTBf-DdjCoAvhai1QpO&index=28&ab_channel=SwiftfulThinking

import SwiftUI

//struct TransitionView: View {
//
//    @State var showView: Bool = false
//
//    //let timming: Double = 9.0
//
//    var body: some View {
//
//        ZStack(alignment: .bottom) {
//
//            VStack {
//                Button("Button") {
//                    showView.toggle()
//                }
//                Spacer()
//            }
//
//            if showView {
//                RoundedRectangle(cornerRadius: 30)
//                    .frame(height: UIScreen.main.bounds.height * 0.7)
//                    .transition(.move(edge: .leading))
//                    .animation(.easeInOut, value: showView)
//            }
//        }
//        .edgesIgnoringSafeArea(.bottom)
//    }
//}
//
//struct TransitionView_Previews: PreviewProvider {
//    static var previews: some View {
//        TransitionView()
//    }
//}


import SwiftUI

struct TransitionView: View {
    @State var showView: Bool = false

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button("Button") {
//                    withAnimation {
//                        showView.toggle()
//                    }
                    withAnimation {
                        showView.toggle()
                    }
                }
                Spacer()
            }

            if showView {
                /*RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.blue)
                    .frame(height: UIScreen.main.bounds.height * 0.7)
                    //.transition(.move(edge: .leading))
                    //.transition(.opacity.animation(.easeInOut))
                    //.transition(AnyTransition.scale.animation(.easeInOut))
                    .transition(.asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .move(edge: .bottom)))
                    //.animation(.easeInOut, value: showView)
                    .animation(.spring())
                 */
                
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.blue)
                    .frame(height: UIScreen.main.bounds.height * 0.7)
                    //.transition(.move(edge: .leading))
                    //.transition(.opacity.animation(.easeInOut))
                    //.transition(AnyTransition.scale.animation(.easeInOut))
                    .transition(.asymmetric(
                        insertion: .move(edge: .bottom),
                        removal: AnyTransition.opacity.animation(.easeInOut)
                    ))
                    //.animation(.easeInOut, value: showView)
                    .animation(.spring(), value: showView)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TransitionView_Previews: PreviewProvider {
     static var previews: some View {
         TransitionView()
     }
 }
 
