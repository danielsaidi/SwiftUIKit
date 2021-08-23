//
//  SystemColor.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-05-09.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This enum contains all SwiftUI system colors and makes them
 iterable and named.
 
 This makes it easy to use them in simple pickers, serialize
 a reference to their color etc. For instance, when a `Color`
 instance is encoded, it takes the current color value. This
 value will not be adaptive to dark and light mode, even for
 colors that originally are adaptive.
 
 `IMPORTANT` Trying to access a `SystemColor`s `color` value
 will trigger a fatal error if the value isn't available for
 the current platform. Avoid this by filtering out supported
 values with the `isSupported` property.
 */
public enum SystemColor: String, CaseIterable {
    
    case primary
    case secondary
    
    case black
    case blue
    case brown
    case clear
    case cyan
    case gray
    case green
    case indigo
    case mint
    case orange
    case pink
    case purple
    case red
    case teal
    case white
    case yellow
    
    #if os(iOS) || os(tvOS)
    case darkGray
    case lightGray
    case magenta
    
    case label
    case secondaryLabel
    case tertiaryLabel
    case quaternaryLabel
    
    case systemFill
    case secondarySystemFill
    case tertiarySystemFill
    case quaternarySystemFill
    #endif
}

public extension SystemColor {
    
    var id: String { rawValue }
    
    var displayName: String { rawValue }
    
    
    var color: Color {
        switch self {
        case .primary: return .primary
        case .secondary: return .secondary
            
        case .black: return .black
        case .blue: return .blue
        case .brown: if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) { return .brown } else { fatalError(error(for: .brown)) }
        case .clear: return .clear
        case .cyan: if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) { return .cyan } else { fatalError(error(for: .cyan)) }
        case .gray: return .gray
        case .green: return .green
        case .indigo: if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) { return .indigo } else { fatalError(error(for: .indigo)) }
        case .mint: if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) { return .mint } else { fatalError(error(for: .mint)) }
        case .orange: return .orange
        case .pink: return .pink
        case .purple: return .purple
        case .red: return .red
        case .teal: if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) { return .teal } else { fatalError(error(for: .teal)) }
        case .white: return .white
        case .yellow: return .yellow
            
        #if os(iOS) || os(tvOS)
        case .darkGray: return Color(UIColor.darkGray)
        case .lightGray: return Color(UIColor.lightGray)
        case .magenta: return Color(UIColor.magenta)
            
        case .label: return Color(UIColor.label)
        case .secondaryLabel: return Color(UIColor.secondaryLabel)
        case .tertiaryLabel: return Color(UIColor.tertiaryLabel)
        case .quaternaryLabel: return Color(UIColor.quaternaryLabel)
            
        case .systemFill: return Color(UIColor.systemFill)
        case .secondarySystemFill: return Color(UIColor.secondarySystemFill)
        case .tertiarySystemFill: return Color(UIColor.tertiarySystemFill)
        case .quaternarySystemFill: return Color(UIColor.quaternarySystemFill)
        #endif
        }
    }
    
    /**
     Whether or not the color is supported for the platform.
     */
    var isSupported: Bool {
        switch self {
        case .primary: return true
        case .secondary: return true
            
        case .black: return true
        case .blue: return true
        case .brown: if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) { return true } else { return false }
        case .clear: return true
        case .cyan: if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) { return true } else { return false }
        case .gray: return true
        case .green: return true
        case .indigo: if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) { return true } else { return false }
        case .mint: if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) { return true } else { return false }
        case .orange: return true
        case .pink: return true
        case .purple: return true
        case .red: return true
        case .teal: if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) { return true } else { return false }
        case .white: return true
        case .yellow: return true
                
        #if os(iOS) || os(tvOS)
        case .darkGray: return true
        case .lightGray: return true
        case .magenta: return true
            
        case .label: return true
        case .secondaryLabel: return true
        case .tertiaryLabel: return true
        case .quaternaryLabel: return true
            
        case .systemFill: return true
        case .secondarySystemFill: return true
        case .tertiarySystemFill: return true
        case .quaternarySystemFill: return true
        #endif
        }
    }
    
    static var random: SystemColor {
        allCases.randomElement() ?? .primary
    }
}

private extension SystemColor {
    
    func error(for color: SystemColor) -> String {
        "\(color.displayName) is not supported on this platform."
    }
}
