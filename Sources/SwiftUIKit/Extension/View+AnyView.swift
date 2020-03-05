//
//  BlurViewTests.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /**
     Wrap the view in an `AnyView`.
     
     This extension makes it easier to chain on an `AnyView`
     instead of wrapping, which is sometimes nicer.
     */
    func any() -> AnyView {
        AnyView(self)
    }
}
