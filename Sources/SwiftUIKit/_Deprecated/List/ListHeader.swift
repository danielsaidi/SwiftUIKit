//
//  ListHeader.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-06-19.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "Just use plain list row modifiers instead.")
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ListHeader: View {
    
    public init(_ text: String) {
        self.text = text
    }
    
    private let text: String

    public var body: some View {
        Text(text)
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets.all(0))
    }
}
