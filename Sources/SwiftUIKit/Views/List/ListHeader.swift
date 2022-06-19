//
//  ListHeader.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-06-19.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view removes the list background and insets for a view.
 */
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ListHeader: View {
    
    public init(_ text: String) {
        self.text = text
    }
    
    private let text: String

    public var body: some View {
        Text(text)
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
struct ListHeader_Previews: PreviewProvider {
    
    static var previews: some View {
        List {
            ListHeader("Text 1")
            ListText("Text with icon and subtitle")
        }
    }
}
