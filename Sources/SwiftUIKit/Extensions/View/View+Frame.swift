//
//  View+Frame.swift
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
    
    /**
     Apply the same size to all sides of the view.
     */
    func frame(square size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }
    
    /**
     This is a shorthand to `frame(height:)`
     */
    func height(_ height: CGFloat) -> some View {
        self.frame(height: height)
    }
    
    /**
     This is a shorthand to `frame(width:)`
     */
    func width(_ width: CGFloat) -> some View {
        self.frame(width: width)
    }
}
