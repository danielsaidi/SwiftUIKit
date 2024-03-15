//
//  View+AnyView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /// Wrap the view in an `AnyView`.
    ///
    /// > Important: Do not misuse AnyView. It esmess up the
    /// view identity, which messes up animations, state etc.
    func any() -> AnyView {
        AnyView(self)
    }
}
