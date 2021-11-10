//
//  MenuListSubtitle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used to display trailing subtitle texts in
 menu list items.
 */
@available(*, deprecated, message: "Use the new ListItem views instead")
public struct MenuListSubtitle: View {
    
    public init(_ text: String) {
        self.text = text
    }
    
    public init(text: String) {
        self.init(text)
    }
    
    private let text: String
    
    public var body: some View {
        Text(text)
            .font(.footnote)
            .foregroundColor(.secondary)
            .lineLimit(1)
    }
}

@available(*, deprecated, message: "Use the new ListItem views instead")
struct MenuListSubtitle_Previews: PreviewProvider {
    
    static var previews: some View {
        MenuListSubtitle("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    }
}
