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
     modifier to make your code cleaner.

     > Important: Do not misuse AnyView. It will mess up the
     view identity, which may mess up animations, state etc.
     */
    func any() -> AnyView {
        AnyView(self)
    }
}
