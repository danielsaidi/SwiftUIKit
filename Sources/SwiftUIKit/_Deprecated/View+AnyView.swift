//
//  View+AnyView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    @available(*, deprecated, message: "This should not be used and will be removed in the next major release.")
    func any() -> AnyView {
        AnyView(self)
    }
}
