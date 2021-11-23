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
        
        let fontName: String
        
        var id: String { fontName }
    }
    
    private var title: String
    
    @Binding
    private var fontName: String
    
    public var body: some View {
        let font = Binding(
            get: { PickerFont(fontName: fontName) },
            set: { fontName = $0.fontName }
        )
        
        return ListPicker(
            title: title,
            items: FontListPickerFont.allFonts,
            selection: font,
            dismissAfterPick: true) { font, isSelected in
                ListSelectItem(isSelected: isSelected) {
                    Text(font.fontName).font(.custom(font.fontName, size: 20))
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
    typealias FontListPickerFont = UIFont
    
    static var allFonts: [FontListPicker.PickerFont] {
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
typealias FontListPickerFont = UIFont

private extension UIFont {
    
    static var allFonts: [FontListPicker.PickerFont] {
        UIFont.familyNames
            .sorted()
            .map {
                FontListPicker.PickerFont(fontName: $0)
            }
    }
}
#endif
