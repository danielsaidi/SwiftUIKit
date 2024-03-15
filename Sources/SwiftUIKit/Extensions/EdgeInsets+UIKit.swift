//
//  UIEdgeInsets+SwiftUI.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-19.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

#if canImport(UIKit)
import SwiftUI
import UIKit

public extension UIEdgeInsets {

    /// Map the insets to a SwiftUI-specific value.
    var insets: EdgeInsets {
        .init(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
#endif
