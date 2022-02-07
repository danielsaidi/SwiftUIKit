//
//  View+Blur.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2019-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS)
import SwiftUI
import UIKit

public extension View {
    
    /**
     Applies a `UIBlurEffect.Style` to the view.
     
     This applies a blur by adding a ``BlurView`` overlay to
     the view.
     */
    @available(*, deprecated, message: "Use the native material approach instead")
    func blur(_ style: UIBlurEffect.Style) -> some View {
        overlay(BlurView(style: style))
    }
}
#endif
