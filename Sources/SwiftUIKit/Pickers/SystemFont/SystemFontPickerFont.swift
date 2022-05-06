//
//  SystemFontPickerFont.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-17.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This struct is used by the various font pickers to make the
 font type platform-agnostic.
 
 To change the display name of the system font, just set the
 picker's static ``systemFontDisplayName`` property.
 */
public struct SystemFontPickerFont: Identifiable {
    
    public init(fontName: String) {
        let fontName = fontName.capitalized
        self.fontName = fontName
        self.fontDisplayName = Self.displayName(for: fontName)
    }

    public let fontName: String
    public let fontDisplayName: String
    
    public var id: String { fontName.lowercased() }
    
    /**
     The display name for the standard system font, which is
     used if the font name is empty.
     */
    public static var systemFontDisplayName: String {
        #if os(macOS)
        return "Standard"
        #else
        return "San Francisco"
        #endif
    }
    
    /**
     The font name prefix for the standard system font. This
     is used if the font name is empty.
     */
    public static var systemFontNamePrefix: String {
        #if os(macOS)
        return ".AppleSystemUIFont"
        #else
        return ".SFUI"
        #endif
    }
}

public extension Collection where Element == SystemFontPickerFont {
    
    /**
     Get all available system fonts.
     */
    static var all: [SystemFontPickerFont] {
        let all = FontRepresentable.allFonts
        let systemFont = SystemFontPickerFont(fontName: "")
        var sorted = all.sorted { $0.fontDisplayName < $1.fontDisplayName }
        sorted.insert(systemFont, at: 0)
        return sorted
    }
    
    /**
     Move a certain font topmost in the list.
     */
    func moveTopmost(_ topmost: String) -> [SystemFontPickerFont] {
        let topmost = topmost.trimmingCharacters(in: .whitespaces)
        let exists = contains { $0.fontName.lowercased() == topmost.lowercased() }
        guard exists else { return Array(self) }
        var filtered = filter { $0.fontName.lowercased() != topmost.lowercased() }
        let new = SystemFontPickerFont(fontName: topmost)
        filtered.insert(new, at: 0)
        return filtered
    }
}

public extension SystemFontPickerFont {
    
    /**
     Get the display name for a certain font name, where the
     name may be a system-specific, non-descriptive one.
     */
    static func displayName(for fontName: String) -> String {
        let isSystem = isSystemFontName(fontName)
        return isSystem ? systemFontDisplayName : fontName
    }
    
    /**
     Check whether or not a certain font name represents the
     standard system font name (e.g. San Francisco for iOS).
     */
    static func isSystemFontName(_ name: String) -> Bool {
        let name = name.trimmingCharacters(in: .whitespaces)
        if name.isEmpty { return true }
        return name.uppercased().hasPrefix(systemFontNamePrefix)
    }
}


// MARK: - AppKit

#if os(macOS)
import AppKit

private extension NSFont {
    
    /**
     Get all available NSFont families.
     */
    static var allFonts: [SystemFontPickerFont] {
        NSFontManager.shared
            .availableFontFamilies
            .map {
                SystemFontPickerFont(fontName: $0)
            }
    }
}
#endif



// MARK: - UIKit

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit

private extension UIFont {
    
    /**
     Get all available NSFont families.
     */
    static var allFonts: [SystemFontPickerFont] {
        UIFont.familyNames
            .map {
                SystemFontPickerFont(fontName: $0)
            }
    }
}
#endif
