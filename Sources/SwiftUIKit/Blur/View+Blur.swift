//
//  View+Blur.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2019-11-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import SwiftUI
import UIKit

public extension View {
    
    /**
     Adds a `BlurView` as an overlay to the view, applying a
     provided blur effect style to the entire view.
     */
    func blur(style: UIBlurEffect.Style) -> some View {
        overlay(BlurView(style: style))
    }
}

