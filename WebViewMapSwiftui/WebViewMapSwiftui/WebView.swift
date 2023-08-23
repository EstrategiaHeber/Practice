//
//  WebView.swift
//  WebViewMapSwiftui
//
//  Created by ALAN CARO on 23/08/23.
//

import SwiftUI
import WebKit

/// UIViewRepresentable es la forma de que un componente visual de UIKIt interactue con uno de SwiftUI
struct WebView: UIViewRepresentable {
    
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: url)!))
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: "KKKKK")
    }
}
