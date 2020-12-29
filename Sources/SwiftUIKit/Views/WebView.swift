//
//  WebView.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-29.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI
import SafariServices

/**
 This view wraps a `SFSafariViewController` using a provided,
 custom url.
 */
public struct WebView: UIViewControllerRepresentable {
    
    public init(url: URL) {
        self.url = url
    }
    
    private let url: URL

    public func makeUIViewController(context: UIViewControllerRepresentableContext<WebView>) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }

    public func updateUIViewController(_ safariViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<WebView>) {}
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: URL(string: "https://danielsaidi.com")!)
    }
}
#endif
