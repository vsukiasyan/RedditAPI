//
//  CommentsWebView.swift
//  RedditAPI
//
//  Created by Vic Sukiasyan on 7/1/21.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}

struct CommentsWebView: View {
    let url: String
    
    var body: some View {
        WebView(request: URLRequest(url: URL(string: url)!))
    }
}

struct CommentsWebView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsWebView(url: "https://www.google.com")
    }
}
