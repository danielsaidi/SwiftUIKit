//
//  View+AnyView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /**
     Wrap the view in an `AnyView`. This lets you chain this
     modifier, which makes the code cleaner.

     `IMPORTANT` You mustn't misuse `AnyView` in SwiftUI. It
     messes up view identity, which will mess up things like
     animations, state etc.
     */
    func any() -> AnyView {
        AnyView(self)
    }
}
