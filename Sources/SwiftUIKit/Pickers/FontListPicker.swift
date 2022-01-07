//
//  FontListPicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-23.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This picker can be used to pick a system font.
 
 The reason why this is a list picker and not just a regular
 SwiftUI `Picker`, is that the regular picker does not apply
 the custom font to the list item.
 
 This picker has support for both AppKit and UIKit, with the
 ``FontListPicker/PickerFont`` used to bridge both platforms.
 
 To change the display name of the system font, just set the
 picker's static ``systemFontDisplayName`` property.
 */
public struct FontListPicker: View {
    
    /**
     Create a font list picker.
     
     - Parameters:
       - title: The list's navigation title.
       - selectedFontName: The selected font name.
     */
    public init(
        title: String,
        selectedFontName: Binding<String>) {
        self.title = title
        self._selectedFontName = selectedFontName
        self.fonts = Self.allFonts(topmost: selectedFontName.wrappedValue)
    }
    
    /**
     This struct is used to avoid having to make the `String`
     type implement `Identifiable`.
     */
    public struct PickerFont: Identifiable {
        
        init(fontName: String) {
            let fontName = fontName.capitalized
            self.fontName = fontName
            self.fontDisplayName = displayName(for: fontName)
        }

        let fontName: String
        let fontDisplayName: String
        
        public var id: String { fontName.lowercased() }
    }
    
    /**
     The list's navigation title.
     */
    private let title: String
    
    /**
     The selected font name.
     */
    @Binding
    private var selectedFontName: String
    
    /**
     The fonts to present in the picker.
     */
    private let fonts: [PickerFont]
    
    /**
     The display name for the standard system font, which is
     used if the font name is empty.
     */
    public static var systemFontDisplayName = "San Francisco"
    
    
    public var body: some View {
        let font = Binding(
            get: { PickerFont(fontName: selectedFontName) },
            set: { selectedFontName = $0.fontName }
        )
        
        return ListPicker(
            title: title,
            items: fonts,
            selection: font,
            dismissAfterPick: true) { font, isSelected in
                ListSelectItem(isSelected: isSelected) {
                    Text(font.fontDisplayName)
                        .font(.custom(font.fontName, size: 20))
                }
            }
    }
}

public extension FontListPicker {
    
    /**
     The available fonts.
     */
    static var allFonts: [PickerFont] {
        var all = FontRepresentable.allFonts
        let systemFont = PickerFont(fontName: "")
        all.insert(systemFont, at: 0)
        return all.sorted { $0.fontDisplayName < $1.fontDisplayName }
    }
    
    /**
     The available fonts.
     */
    static func allFonts(topmost: String) -> [PickerFont] {
        let all = allFonts
        let topmost = topmost.trimmingCharacters(in: .whitespaces)
        let exists = all.contains { $0.fontName.lowercased() == topmost.lowercased() }
        guard exists else { return all }
        var filtered = all.filter { $0.fontName.lowercased() != topmost.lowercased() }
        let new = PickerFont(fontName: topmost)
        filtered.insert(new, at: 0)
        return filtered
    }
    
    /**
     Check whether or not a certain font name represents the
     standard system font name (San Francisco).
     */
    static func displayName(for fontName: String) -> String {
        let isSystem = isSystemFontName(fontName.uppercased())
        return isSystem ? systemFontDisplayName : fontName
    }
    
    /**
     Check whether or not a certain font name represents the
     standard system font name (San Francisco).
     */
    static func isSystemFontName(_ name: String) -> Bool {
        let name = name.trimmingCharacters(in: .whitespaces)
        if name.isEmpty { return true }
        return name.hasPrefix(".SFUI")
    }
}


#if os(iOS) || os(tvOS)
struct FontListPicker_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State private var font = ""
        
        var body: some View {
            NavigationView {
                FontListPicker(
                    title: "Pick a font",
                    selectedFontName: $font)
            }
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
#endif


// MARK: - AppKit

#if os(macOS)
import AppKit

typealias FontRepresentable = NSFont

private extension NSFont {
    
    /**
     Get all available NSFont families.
     */
    static var allFonts: [FontListPicker.PickerFont] {
        NSFontManager.shared
            .availableFontFamilies
            .map {
                FontListPicker.PickerFont(fontName: $0)
            }
    }
}
#endif



// MARK: - UIKit

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit

typealias FontRepresentable = UIFont

private extension UIFont {
    
    /**
     Get all available NSFont families.
     */
    static var allFonts: [FontListPicker.PickerFont] {
        UIFont.familyNames
            .map {
                FontListPicker.PickerFont(fontName: $0)
            }
    }
}
#endif
