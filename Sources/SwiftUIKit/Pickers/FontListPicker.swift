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
 ``FontListPickerFont`` typealias being used to bridge these
 two platforms with the picker.
 */
public struct FontListPicker: View {
    
    public init(
        title: String,
        selectedFontName: Binding<String>) {
        self.title = title
        self._fontName = selectedFontName
    }
    
    struct PickerFont: Identifiable {
        
        init(fontName: String) {
            let isSystem = fontName
                .trimmingCharacters(in: .whitespaces)
                .isEmpty
            self.fontName = fontName
            self.displayName = isSystem ? "Standard" : fontName
        }

        let fontName: String
        let displayName: String
        
        var id: String { fontName }
    }
    
    private var title: String
    
    @Binding
    private var fontName: String
    
    private var fonts: [PickerFont] {
        FontRepresentable.allFonts(
            topmost: fontName)
    }
    
    public var body: some View {
        let font = Binding(
            get: { PickerFont(fontName: fontName) },
            set: { fontName = $0.fontName }
        )
        
        return ListPicker(
            title: title,
            items: fonts,
            selection: font,
            animatedSelection: true,
            dismissAfterPick: true) { font, isSelected in
                ListSelectItem(isSelected: isSelected) {
                    Text(font.displayName).font(.custom(font.fontName, size: 20))
                }
            }
    }
}

struct FontListPicker_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State private var font = "Arial"
        
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



// MARK: - AppKit

#if os(macOS)
import AppKit

private extension NSFont {
    
    /**
     This `UIFont` typealias is to be used with ``FontListPicker``.
     */
    typealias FontRepresentable = UIFont
    
    static var allFontFamilies: [FontListPicker.PickerFont] {
        NSFontManager.shared
            .availableFontFamilies
            .sorted()
            .map {
                FontListPicker.PickerFont(fontName: $0)
            }
    }
}



// MARK: - UIKit

#elseif os(iOS) || os(tvOS) || os(watchOS)
import UIKit

/**
 This `UIFont` typealias is to be used with ``FontListPicker``.
 */
typealias FontRepresentable = UIFont

private extension UIFont {
    
    static var allFontFamilies: [FontListPicker.PickerFont] {
        UIFont.familyNames
            .sorted()
            .map {
                FontListPicker.PickerFont(fontName: $0)
            }
    }
}
#endif


// MARK: - All Fonts

extension FontRepresentable {
    
    static var allFonts: [FontListPicker.PickerFont] {
        var all = allFontFamilies
        let systemFont = FontListPicker.PickerFont(fontName: "")
        all.insert(systemFont, at: 0)
        return all
    }
    
    static func allFonts(topmost: String) -> [FontListPicker.PickerFont] {
        let all = allFonts
        let topmost = topmost.trimmingCharacters(in: .whitespaces)
        let exists = all.contains { $0.fontName == topmost }
        guard exists else { return all }
        var filtered = all.filter { $0.fontName != topmost }
        let new = FontListPicker.PickerFont(fontName: topmost)
        filtered.insert(new, at: 0)
        return filtered
    }
}
