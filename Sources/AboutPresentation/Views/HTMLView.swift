//
//  HTMLView.swift
//  AboutFeature
//
//  Created by Pawel Milek on 12/25/23.
//  Copyright © 2023 Pawel Milek. All rights reserved.
//

import SwiftUI
import WebKit

struct HTMLView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    private let content: String?

    init(content: String?) {
        self.content = content
    }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.allowsBackForwardNavigationGestures = true
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let content else { return }
        uiView.loadHTMLString(content, baseURL: nil)
    }
}
