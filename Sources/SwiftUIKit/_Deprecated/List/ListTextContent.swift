//
//  ListTextContent.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-02-04.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "Just use a plain label instead.")
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
                Label { Text(text) } icon: { EmptyView() }
            }
            
            if let subtitle = subtitle {
                Spacer()
                ListSubtitle(subtitle)
            }
        }
    }
}

@available(*, deprecated, message: "Just use a plain label instead.")
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

@available(*, deprecated, message: "Just use a plain label instead.")
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
