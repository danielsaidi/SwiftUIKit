//
//  MenuListSection.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-09-09.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import SwiftUI

/**
 This is a regular `Section` that enforces a `MultilineText`
 header and footer, since these can get cut off.
 
 The view only supports text content.
 */
@available(*, deprecated, message: "Use the new ListItem views instead")
public struct MenuListSection<Content: View>: View {
    
    public init(
        header: String? = nil,
        footer: String? = nil,
        @ViewBuilder content: @escaping ContentBuilder) {
        self.header = header
        self.footer = footer
        self.content = content
    }
    
    private let header: String?
    private let footer: String?
    private let content: ContentBuilder
    
    public typealias ContentBuilder = () -> Content
    
    public var body: some View {
        Section(header: view(for: header), footer: view(for: footer)) {
            content()
        }
    }
}

@available(*, deprecated, message: "Use the new ListItem views instead")
private extension MenuListSection {
    
    @ViewBuilder
    func view(for text: String?) -> some View {
        if let text = text, text.count > 0 {
            MultilineText(text)
        } else {
            EmptyView()
        }
    }
}

@available(*, deprecated, message: "Use the new ListItem views instead")
struct MenuListSection_Previews: PreviewProvider {
    static var previews: some View {
        List {
            MenuListSection {
                Text("Hej")
            }
            MenuListSection {
                Text("Hej")
            }
            MenuListSection(header: "") {
                Text("Hej")
            }
        }
    }
}
#endif
