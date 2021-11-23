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
        self.fonts = allFonts(topmost: selectedFontName.wrappedValue)
    }
    
    /**
     This struct is used to avoid having to make the `String`
     type implement `Identifiable`.
     */
    struct PickerFont: Identifiable {
        
        init(fontName: String) {
            let isSystem = fontName
                .trimmingCharacters(in: .whitespaces)
                .isEmpty
            self.fontName = fontName
            self.displayName = isSystem ? systemFontDisplayName : fontName
        }

        let fontName: String
        let displayName: String
        
        var id: String { fontName }
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
    @State
    private var fonts: [PickerFont] = []
    
    /**
     The display name for the standard system font, which is
     used if the font name is empty.
     */
    public static var systemFontDisplayName = "Standard"
    
    
    
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
                    Text(font.displayName).font(.custom(font.fontName, size: 20))
                }
            }.onAppear {
                fonts = allFonts(topmost: selectedFontName)
            }
    }
}

private extension FontListPicker {
    
    /**
     The available fonts.
     */
    var allFonts: [PickerFont] {
        var all = FontRepresentable.allFonts
        let systemFont = FontListPicker.PickerFont(fontName: "")
        all.insert(systemFont, at: 0)
        return all
    }
    
    /**
     The available fonts.
     */
    func allFonts(topmost: String) -> [FontListPicker.PickerFont] {
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

typealias FontRepresentable = NSFont

private extension NSFont {
    
    /**
     Get all available NSFont families.
     */
    static var allFonts: [FontListPicker.PickerFont] {
        NSFontManager.shared
            .availableFontFamilies
            .sorted()
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
            .sorted()
            .map {
                FontListPicker.PickerFont(fontName: $0)
            }
    }
}
#endif
