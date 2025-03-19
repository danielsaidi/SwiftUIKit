//
//  ListAction.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-11-21.
//

import SwiftUI

/// This enum defines actions that can be triggered within a
/// form or a list.
public enum ListAction {
    
    /// Call a phone number.
    case call(phoneNumber: String)
    
    /// Copy a text.
    case copy(String)
    
    /// Copy an image.
    case copyImage(ImageRepresentable)
    
    /// Send an e-mail.
    case email(address: String)
    
    /// Open a certain URL.
    case openUrl(_ url: String)
}

public extension ListAction {
    
    var accessibilityLabel: String {
        switch self {
        case .call(let url): "Call \(url)"
        case .copy(let text): "Copy \(text.prefix(10))"
        case .copyImage: "Copy Image"
        case .email(let addr): "Email \(addr)"
        case .openUrl(let url): "Open \(url)"
        }
    }
    
    @ViewBuilder
    var button: some View {
        button {
            icon
        }
    }
    
    @ViewBuilder
    func button<Content: View>(
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        switch self {
        case .call(let url): link(for: calllUrl(for: url), content)
        case .copy(let text): button({ copy(text) }, content: content)
        case .copyImage(let img): button({ copy(img) }, content: content)
        case .email(let addr): link(for: emailUrl(for: addr), content)
        case .openUrl(let str): link(for: url(for: str), content)
        }
    }
    
    var icon: Image {
        switch self {
        case .call: .init(systemName: "phone")
        case .copy, .copyImage: .init(systemName: "doc.on.doc")
        case .email: .init(systemName: "envelope")
        case .openUrl: .init(systemName: "safari")
        }
    }
}

private extension ListAction {
    
    func emailUrl(for url: String) -> URL? {
        .init(string: "mailto:\(url)")
    }
    
    func calllUrl(for url: String) -> URL? {
        .init(string: "tel:\(url)")
    }
    
    func url(for url: String) -> URL? {
        .init(string: url)
    }
}

private extension ListAction {
    
    func button<Content: View>(
        _ action: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        Button(action: action) {
            content()
        }
        .accessibilityHint(Text(accessibilityLabel))
    }
    
    @ViewBuilder
    func link<Content: View>(
        for url: URL?,
        @ViewBuilder _ content: @escaping () -> Content
    ) -> some View {
        if let url {
            Link(destination: url) {
                content()
            }
        }
    }
}

private extension ListAction {
    
    func copy(_ value: String) {
        #if os(macOS) || os(iOS)
        Pasteboard.general.copy(value)
        #else
        print("Unsupported platform")
        #endif
    }
    
    func copy(_ image: ImageRepresentable) {
        #if os(iOS)
        Pasteboard.general.image = image
        #elseif os(macOS)
        Pasteboard.general.clearContents()
        Pasteboard.general.writeObjects([image])
        #else
        print("Unsupported platform")
        #endif
    }
}

#Preview {
    
    func view(for action: ListAction) -> some View {
        action.button
    }
    
    return List {
        view(for: .call(phoneNumber: "abc123"))
        #if os(macOS) || os(iOS) || os(visionOS)
        view(for: .copy("abc123"))
        #endif
        view(for: .email(address: "abc123"))
        view(for: .openUrl("https://danielsaidi.com"))
    }
}
