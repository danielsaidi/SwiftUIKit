//
//  UIEdgeInsets+Insets.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-09-30.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension EdgeInsets {
    
    /**
     Create an `EdgeInsets` with the same insets everywhere.
     */
    static func all(_ all: CGFloat) -> EdgeInsets {
        self.init(
            top: all,
            leading: all,
            bottom: all,
            trailing: all)
    }
    
    /**
     Create an `EdgeInsets` with horizontal/vertical values.
     */
    static func horizontal(
        _ horizontal: CGFloat,
        vertical: CGFloat
    ) -> EdgeInsets {
        self.init(
            top: vertical,
            leading: horizontal,
            bottom: vertical,
            trailing: horizontal)
    }
}
