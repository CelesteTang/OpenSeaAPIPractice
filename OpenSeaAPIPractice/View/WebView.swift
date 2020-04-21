//
//  WebView.swift
//  OpenSeaAPIPractice
//
//  Created by 湯芯瑜 on 2020/4/20.
//  Copyright © 2020 Hsin-Yu Tang. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let url: String
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: url) {
            webView.load(URLRequest(url: url))
            webView.navigationDelegate = context.coordinator
            webView.addSubview(context.coordinator.indicatorView)
            context.coordinator.indicatorView.frame.origin = CGPoint(x: UIScreen.main.bounds.width / 2, y: 16)
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {}
    
    func makeCoordinator() -> WebView.Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        
        let indicatorView = UIActivityIndicatorView(style: .medium)
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            indicatorView.startAnimating()
        }
        
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            indicatorView.stopAnimating()
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            indicatorView.stopAnimating()
        }
    }
}
