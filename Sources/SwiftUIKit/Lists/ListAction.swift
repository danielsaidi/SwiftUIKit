//
//  FormQuickAction.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-11-21.
//

import SwiftUI

/**
 This enum defines quick list actions, that can be triggered
 within a form or list.
 
 You can use the `view` view builder to get a view that will
 trigger the action when it's
 */
public enum ListAction {
    
    /// Call a certain phone number.
    case call(phoneNumber: String)
    
    /// Copy a certain value.
    case copy(String)
    
    /// Email a certain address.
    case email(address: String)
    
    /// Open a certain URL.
    case open(url: String)
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
            link(url: URL(string: "tel:\(url)"), content: content)
        case .copy(let text):
            button(action: { copy(text) }, content: content)
        case .email(let url):
            link(url: URL(string: "mailto:\(url)"), content: content)
        case .open(let url):
            link(url: URL(string: url), content: content)
        }
    }
    
    var icon: Image {
        switch self {
        case .call: .init(systemName: "phone")
        case .copy: .init(systemName: "doc.on.doc")
        case .email: .init(systemName: "envelope")
        case .open: .init(systemName: "safari")
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
        Pasteboard.general.copy(value)
    }
}

#Preview {
    
    func view(for action: ListAction) -> some View {
        action.button
    }
    
    return List {
        view(for: .call(phoneNumber: "abc123"))
        view(for: .copy("abc123"))
        view(for: .email(address: "abc123"))
        view(for: .open(url: "https://danielsaidi.com"))
    }
}
