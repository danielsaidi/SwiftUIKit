//
//  SafariWebView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-12-29.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI
import SafariServices

/**
 This view wraps a `SFSafariViewController` that can request
 any url you provide it with.
 */
@available(*, deprecated, message: "This type has been moved to WebViewKit - https://github.com/danielsaidi/WebViewKit")
public struct SafariWebView: UIViewControllerRepresentable {
    
    /**
     Create a Safari-based web view.
     
     - Parameters:
       - url: The url to load into the web view.
     */
    public init(url: URL) {
        self.url = url
    }
    
    private let url: URL

    public func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }

    public func updateUIViewController(_ safariViewController: SFSafariViewController, context: Context) {}
}
#endif
