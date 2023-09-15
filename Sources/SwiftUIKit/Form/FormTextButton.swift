//
//  FormTextButton.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-09-11.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This view can be used to add a quick action to a ``FormText``
 component.
 
 When using `call` and `email` actions, just provide the raw
 URL without the `tel:` or `mailto:` prefix.
 */
@available(iOS 15.0, *)
public struct FormTextButton: View {
    
    public init(
        _ action: ActionType,
        label: String
    ) {
        self.action = action
        self.label = label
    }
    
    private let action: ActionType
    private let label: String
    
    public enum ActionType {
        
        /// Call a certain phone number.
        case call(phoneNumber: String)
        
        /// Copy a certain value.
        case copy(String)
        
        /// Email a certain address.
        case email(address: String)
        
        /// Open a certain URL.
        case open(url: String)
    }
    
    public var body: some View {
        switch action {
        case .call(let url):
            link(icon("phone"), url: URL(string: "tel:\(url)"))
        case .copy(let text):
            button(icon("doc.on.doc")) { copy(text) }
        case .email(let url):
            link(icon("envelope"), url: URL(string: "mailto:\(url)"))
        case .open(let url):
            link(icon("safari"), url: URL(string: url))
        }
    }
}

@available(iOS 15.0, *)
private extension FormTextButton {
    
    func copy(_ value: String) {
        UIPasteboard.general.string = value
    }
}

@available(iOS 15.0, *)
private extension FormTextButton {
    
    func icon(_ name: String) -> some View {
        Image(systemName: name)
    }
    
    func button<Icon: View>(
        _ icon: Icon,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            icon
        }.formTextButton(label: label)
    }
    
    @ViewBuilder
    func link<Icon: View>(
        _ icon: Icon,
        url: URL?
    ) -> some View {
        if let url {
            Link(destination: url) {
                icon
            }.formTextButton(label: label)
        }
    }
}

@available(iOS 15.0, *)
private extension View {
    
    func formTextButton(label: String) -> some View {
        self.buttonStyle(.borderless)
            .accessibilityLabel(label)
    }
}

@available(iOS 15.0, *)
struct FormTextButton_Previews: PreviewProvider {
    
    static var action: (() -> Void) = {}
    
    static var previews: some View {
        VStack {
            FormText(title: "Test", text: "Test", action: .call(phoneNumber: "apa"), actionLabel: "")
            List {
                FormText(title: "Test", text: "Test", action: .call(phoneNumber: "apa"), actionLabel: "")
                FormText(title: "Test", text: "Test", action: .copy("apa"), actionLabel: "")
                FormText(title: "Test", text: "Test", action: .email(address: "apa"), actionLabel: "")
                FormText(title: "Test", text: "Test", action: .open(url: "apa"), actionLabel: "")
            }
        }
    }
}
#endif
