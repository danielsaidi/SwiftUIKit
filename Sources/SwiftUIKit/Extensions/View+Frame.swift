//
//  View+Enabled.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-01-05.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /**
     Positions this view within an invisible frame using the
     provided size.
     */
    func frame(_ size: CGSize) -> some View {
        self.frame(width: size.width, height: size.height)
    }
}
