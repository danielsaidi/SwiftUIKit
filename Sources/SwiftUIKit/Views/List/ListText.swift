//
//  ListText.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view embeds the provided texts and icon in an `HStack`
 and wraps the stack in a ``ListItem``.
 
 Use this view when you want to render the content as a full
 list item, with all the padding and other tweaks that comes
 with it. Use ``ListTextContent`` to just get plain content.
 */
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ListText<Icon: View>: View {
    
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
        ListItem {
            ListTextContent(text, icon: icon, subtitle: subtitle)
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public extension ListText where Icon == EmptyView {
    
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
public extension ListText where Icon == Image {
    
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
struct ListText_Previews: PreviewProvider {
    
    static var previews: some View {
        List {
            ListText("Text 1")
            ListText("Text 2")
            ListText(
                "Text with icon",
                icon: Image(systemName: "lightbulb"))
            ListText(
                "Text with color badge",
                icon: Color.blue.clipShape(Circle()).padding(1))
            ListText(
                "Text with icon and subtitle",
                icon: Image(systemName: "lightbulb"),
                subtitle: "Subtitle")
        }
    }
}
