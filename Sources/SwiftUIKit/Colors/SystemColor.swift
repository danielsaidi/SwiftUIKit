//
//  SystemColor.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-05-09.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This enum contains all SwiftUI system colors, and make them
 iterable and named.
 
 This makes it easy to use them in simple pickers, serialize
 a reference to their color etc. For instance, when a `Color`
 instance is encoded, it takes the current color value. This
 value will not be adaptive to dark and light mode, even for
 colors that originally are adaptive.
 */
public enum SystemColor: String, CaseIterable {
    
    case primary
    case secondary
    
    case blue
    case gray
    case green
    case orange
    case pink
    case purple
    case red
    case yellow
}

public extension SystemColor {
    
    var color: Color {
        switch self {
        case .primary: return .primary
        case .secondary: return .secondary
        
        case .blue: return .blue
        case .gray: return .gray
        case .green: return .green
        case .orange: return .orange
        case .pink: return .pink
        case .purple: return .purple
        case .red: return .red
        case .yellow: return .yellow
        }
    }
    
    var id: String { rawValue }
    
    var displayName: String { rawValue }
    
    static var random: SystemColor {
        allCases.randomElement() ?? .primary
    }
}
