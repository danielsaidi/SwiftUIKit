//
//  View+NavbarTitle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-01-21.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public extension View {
    
    /**
     Apply any view as a navbar title view.
     */
    func navigationTitleView<Content: View>(_ view: Content) -> some View {
        self.toolbar {
            ToolbarItemGroup(placement: .principal) {
                view
            }
        }
    }
}
