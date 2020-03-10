//
//  FontStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-10.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This struct represents a custom font with a `name`, `style`
 and `weight`.
 
 You can apply this style with the `shadow(_ style:)` `View`
 extension or use its properties directly using the built-in
 `font(name:,style:,weight:)` extension.
 
 You can specify your own standard styles by creating static,
 calculated `FontStyle` extension properties.
 */
public struct FontStyle {
    
    public var name: String
    public var style: UIFont.TextStyle
    public var weight: Font.Weight = .regular
    
    public var font: Font {
        Font.custom(name, size: size).weight(weight)
    }
    
    public var size: CGFloat {
        UIFont.preferredFont(forTextStyle: style).pointSize
    }
}
