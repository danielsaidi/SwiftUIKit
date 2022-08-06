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

     `IMPORTANT` You mustn't misuse `AnyView` in SwiftUI. It
     messes up the view hierarchy, which will mess up things
     like animations, state etc. However, when you MUST have
     an `AnyView`, this is convenient.
     */
    func any() -> AnyView {
        AnyView(self)
    }
}
