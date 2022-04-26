//
//  WebView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-24.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(iOS)
@available(*, deprecated, message: "This type has been moved to WebViewKit - https://github.com/danielsaidi/WebViewKit")
public typealias WebViewRepresentable = UIViewRepresentable
#elseif os(macOS)
@available(*, deprecated, message: "This type has been moved to WebViewKit - https://github.com/danielsaidi/WebViewKit")
public typealias WebViewRepresentable = NSViewRepresentable
#endif

#if os(iOS) || os(macOS)
import SwiftUI
import WebKit

/**
 This view wraps a `WKViewView` that can request any url you
 provide it with and be configured in any way that you like.
 */
@available(*, deprecated, message: "This type has been moved to WebViewKit - https://github.com/danielsaidi/WebViewKit")
public struct WebView: WebViewRepresentable {
    
    /**
     Create a web view instance.
     
     The provided `url`, if any, will be requested after the
     view is configured with the provided `configuration`.
     
     - Parameters:
       - url: The url to request, if any.
       - configuration: The configuration to apply to the view.
     */
    public init(
        url: URL?,
        configuration: @escaping (WKWebView) -> Void = { _ in }) {
        self.url = url
        self.configuration = configuration
    }
    
    private let url: URL?
    private let configuration: (WKWebView) -> Void
    
    #if os(iOS)
    public func makeUIView(context: Context) -> WKWebView {
        makeView()
    }
    
    public func updateUIView(_ uiView: WKWebView, context: Context) {}
    #endif
    
    #if os(macOS)
    public func makeNSView(context: Context) -> WKWebView {
        makeView()
    }
    
    public func updateNSView(_ view: WKWebView, context: Context) {}
    #endif
    
    private func makeView() -> WKWebView {
        let view = WKWebView()
        configuration(view)
        if let url = url {
            view.load(URLRequest(url: url))
        }
        return view
    }
}
#endif
