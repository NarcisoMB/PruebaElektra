//  Helper.swift
//  PruebaElektra
//  Created by Narciso Meza on 22/08/21.

import Foundation
import SwiftUI
import WebKit


/*
            Codigo que permite hacer cambio de Vistas
*/
class SwiftUIViewCModel: ObservableObject {
    @Published var state : SwiftUIViewCModelState = .moviesViews
    
    static let shared = SwiftUIViewCModel()
    
    private init() {}
}

enum SwiftUIViewCModelState {
    case moviesViews
    case seriesViews
}

/*
            Codigo para extraer Información de un String
*/
extension Array {
    func split() -> (left: [Element], right: [Element]) {
        let ct = self.count
        let half = ct / 2
        let leftSplit = self[0 ..< half]
        let rightSplit = self[half ..< ct]
        return (left: Array(leftSplit), right: Array(rightSplit))
    }
}


/*
            Codigo para poder cargar los Videos de forma correcta
*/
struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView

    let webView: WKWebView
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
}

class WebViewModel: ObservableObject {
    let webView: WKWebView
    var url: URL
    
    init() {
        webView = WKWebView(frame: .zero)
        url = URL(string: "youtube.com")!
    }
    
    func loadUrl() {
        webView.load(URLRequest(url: url))
    }
}
