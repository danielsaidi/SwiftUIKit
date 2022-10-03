//
//  ListText.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "Just use a plain label instead.")
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
        ListTextContent(text, icon: icon, subtitle: subtitle)
    }
}

@available(*, deprecated, message: "Just use a plain label instead.")
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

@available(*, deprecated, message: "Just use a plain label instead.")
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
