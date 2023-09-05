//
//  ContentView.swift
//  MenuDesplegable
//
//  Created by ALAN CARO on 05/09/23.
//

import SwiftUI

struct MainInformation {
    
    var category: Category
    
    enum Category: String, CaseIterable {
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
        case dessert = "Dessert"
    }
}

struct ContentView: View {
    
    // 1.- OK @State private var backgroundColor: ColorList = .white
    @State var mainInformation :  MainInformation
    var body: some View {
        
        Picker(selection: $mainInformation.category, label: HStack {
            Text(mainInformation.category.rawValue)
        }) {
            ForEach(MainInformation.Category.allCases, id: \.self) { category in
                Text(category.rawValue)
            }
        }
        //.listRowBackground(rowBackgroundColor)
        .pickerStyle(MenuPickerStyle())
        
        /*1.- OK ZStack {
            
            switch backgroundColor {
            case .yellow: Color.yellow.ignoresSafeArea(.all)
            case .red: Color.red.ignoresSafeArea(.all)
            case .black: Color.black.ignoresSafeArea(.all)
            default: Color.white.ignoresSafeArea(.all)
                
            }
            
            Menu {
                ForEach(ColorList.allCases) { index in
                    Button("\(index.rawValue)", action: {
                        backgroundColor = index
                    })
                }
            } label: {
                HStack {
                    Image(systemName: "eyedropper.full")
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 12, leading: 7, bottom: 12, trailing: 0))
                    Text("\(backgroundColor.rawValue)")
                        .font(.title3)
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 7))
                }
            }
            .frame(width: 120)
            .background(Color.blue)
            .cornerRadius(15)
        }*/
    }
}

extension ContentView {
    
    enum ColorList: String, CaseIterable, Identifiable {
        case white, yellow, red, black
        var id: Self { self }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    @State static var mainInformation = MainInformation(category: .breakfast)
    static var previews: some View {
        ContentView(mainInformation: mainInformation)
    }
}

