//
//  View+AnyView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /**
     Wrap the view in an `AnyView`. This lets you chain on a
     modifier than to wrap it, which makes the code cleaner.
     */
    func any() -> AnyView {
        AnyView(self)
    }
}
