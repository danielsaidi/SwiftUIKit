//
//  SystemFontPicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-17.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This system font picker renders a plain `ForEach` view that
 lists a collection of fonts, of which one can be selected.
 
 The reason why this is not just a regular `Picker`, is that
 regular pickers don't show custom fonts.
 */
public struct SystemFontPicker: View {
    
    /**
     Create a font list picker.
     
     - Parameters:
       - selectedFontName: The selected font name.
       - fonts: The fonts to display in the list, by default `all`.
       - itemFontSize: The font size to use in the list items.
       - dismissAfterPick: Whether or not to dismiss the picker after a font has been selected, by default `true`.
     */
    public init(
        selectedFontName: Binding<String>,
        fonts: [SystemFontPickerFont] = .all,
        itemFontSize: CGFloat = 20,
        dismissAfterPick: Bool = true) {
        self._selectedFontName = selectedFontName
        self.fonts = fonts
        self.itemFontSize = itemFontSize
        self.dismissAfterPick = dismissAfterPick
    }
    
    private let itemFontSize: CGFloat
    private let dismissAfterPick: Bool
    
    @Binding
    private var selectedFontName: String
    
    /**
     The fonts to present in the picker.
     */
    private let fonts: [SystemFontPickerFont]
    
    
    public var body: some View {
        let font = Binding(
            get: { SystemFontPickerFont(fontName: selectedFontName) },
            set: { selectedFontName = $0.fontName }
        )
        
        ForEachPicker(
            items: fonts,
            selection: font,
            dismissAfterPick: dismissAfterPick) { font, isSelected in
                SystemFontPickerItem(
                    font: font,
                    fontSize: itemFontSize,
                    isSelected: isSelected)
            }
    }
}


#if os(iOS) || os(tvOS)
struct SystemFontPicker_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State private var font = ""
        
        var body: some View {
            NavigationView {
                SystemFontPicker(
                    selectedFontName: $font)
            }
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
#endif
