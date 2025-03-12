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
        case .call(let url):
            link(url: .init(string: "tel:\(url)"), content: content)
        case .copy(let text):
            button(action: { copy(text) }, content: content)
        case .copyImage(let image):
            button(action: { copy(image) }, content: content)
        case .email(let url):
            link(url: .init(string: "mailto:\(url)"), content: content)
        case .openUrl(let url):
            link(url: .init(string: url), content: content)
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
    
    func button<Content: View>(
        action: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        Button(action: action) {
            content()
        }
    }
    
    @ViewBuilder
    func link<Content: View>(
        url: URL?, 
        @ViewBuilder content: @escaping () -> Content
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
