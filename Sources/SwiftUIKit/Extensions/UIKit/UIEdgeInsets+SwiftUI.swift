//
//  UIEdgeInsets+SwiftUI.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-19.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if canImport(UIKit)
import SwiftUI
import UIKit

public extension UIEdgeInsets {

    /**
     Get SwiftUI edge insets for these UIKit-specific insets.
     */
    var insets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
#endif
