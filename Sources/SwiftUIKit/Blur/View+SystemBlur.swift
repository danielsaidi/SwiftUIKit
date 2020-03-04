//
//  View+SystemBlur.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2019-11-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import SwiftUI
import UIKit

public extension View {
    
    /**
     Add a `BlurView` instance as an overlay to the view. It
     will apply the provided blur effect to the entire view.
     */
    func systemBlur(style: UIBlurEffect.Style) -> some View {
        overlay(BlurView(style: style))
    }
}

