//
//  ContentView.swift
//  WebViewMapSwiftui
//
//  Created by ALAN CARO on 23/08/23.
//

import SwiftUI

struct ContentView: View {
    private var url = "https://www.benedettis.com/"
    @State private var showWebView = false
    @State private var showSafariWebView = false
    
    var body: some View {
        VStack {
            
            /// 1.- Primer metodo, con este metodo te dirige a una vista web externa
            Link(destination: URL(string: url)!) {
                Text("Visita un link")
            }
            
            /// 2.- Utilizadno un WKWebView
            Button {
                showWebView = true
            } label: {
                Text("Abrir Web View")
            }.sheet(isPresented: $showWebView) {
                WebView(url: url)
            }
            
            /// 3- Utilizadno un SafariWebView
            Button {
                showSafariWebView = true
            } label: {
                Text("Abrir SafariViewController")
            }
            .sheet(isPresented: $showSafariWebView) {
                SafariWebView(url: url)
            }
//            .fullScreenCover(isPresented: $showSafariWebView, content: {
//                SafariWebView(url: url)
//            })

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
