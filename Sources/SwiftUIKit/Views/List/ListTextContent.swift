//
//  ListTextContent.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-02-04.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view embeds the provided texts and icon in an `HStack`
 and wraps the stack in a ``ListItem``.
 
 Use this view when you just want the plain content, without
 any list item modifications. Use ``ListText`` to get a full
 list item rendering of the same content.
 */
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ListTextContent<Icon: View>: View {
    
    public init(
        _ text: String,
        icon: Icon,
        subtitle: String? = nil
    ) {
        self.text = text
        self.icon = icon
        self.subtitle = subtitle
    }
    
    private let icon: Icon?
    private let text: String
    private let subtitle: String?
    
    public var body: some View {
        HStack {
            if let icon = icon {
                Label { Text(text) } icon: { icon }
            } else {
                Text(text)
            }
            
            if let subtitle = subtitle {
                Spacer()
                ListSubtitle(subtitle)
            }
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public extension ListTextContent where Icon == EmptyView {
    
    init(
        _ text: String,
        subtitle: String? = nil
    ) {
        self.text = text
        self.icon = nil
        self.subtitle = subtitle
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public extension ListTextContent where Icon == Image {
    
    init(
        _ text: String,
        icon: Image,
        subtitle: String? = nil
    ) {
        self.text = text
        self.icon = icon
        self.subtitle = subtitle
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
struct ListTextContent_Previews: PreviewProvider {
    
    static var previews: some View {
        List {
            ListTextContent("Text 1")
            ListTextContent("Text 2")
            ListTextContent(
                "Text with icon",
                icon: Image(systemName: "lightbulb"))
            ListTextContent(
                "Text with color badge",
                icon: Color.blue.clipShape(Circle()).padding(1))
            ListTextContent(
                "Text with icon and subtitle",
                icon: Image(systemName: "lightbulb"),
                subtitle: "Subtitle")
        }
    }
}
