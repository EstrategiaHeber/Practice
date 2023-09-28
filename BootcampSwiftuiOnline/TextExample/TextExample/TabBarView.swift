//
//  TabBarView.swift
//  TextExample
//
//  Created by ALAN CARO on 22/09/23.
//

import SwiftUI

struct TabBarView: View {
    
    // PROPIEDADES EJEMPLO 1
    @State var selectedTab: Int = 0
    
    // PROPIEDADES EJEMPLO 2
    let icons: [String] = ["heart.fill", "globe", "house.fill", "person.fill"]
    
    var body: some View {
        
        // EJEMPLO 1
        
//        TabView(selection: $selectedTab) {
//            
//            HomeView(selectedTab: $selectedTab)
//                .tabItem {
//                    Image(systemName: "house.fill")
//                    Text("Home")
//                }
//                .tag(0)
//            
//            Text("BROWSE TAB")
//                .tabItem {
//                    Image(systemName: "globe")
//                }
//                .tag(1)
//            
//            Text("PROFILE TAB")
//                .tabItem {
//                    Image(systemName: "person.fill")
//                }
//                .tag(2)
//        }
//        .accentColor(.yellow)
        
        // EJEMPLO 2
        
        TabView {
            /*RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.red)
            RoundedRectangle(cornerRadius: 25)
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.green)*/
            
            ForEach(icons, id: \.self) { icon in
                
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .padding(30)
            }
        }
        .background(
            RadialGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .center, startRadius: 5, endRadius: 300)
        )
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())
        
    }
}

#Preview {
    TabBarView()
}

struct HomeView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        
        ZStack {
            
            Color.blue
            
            VStack {
                Text("HOME TAB")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Button(action: {
                    selectedTab = 2
                }, label: {
                    Text("Go to porfile!!")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                })
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}
