//
//  SystemFontForEachPicker.swift
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
 regular pickers don't show custom fonts on some platforms.
 */
public struct SystemFontForEachPicker: View {
    
    /**
     Create a font list picker.
     
     - Parameters:
       - selectedFontName: The selected font name.
       - fonts: The fonts to display in the list, by default `all`.
       - itemFontSize: The font size to use in the list items.
       - dismissAfterPick: Whether or not to dismiss the picker after a font has been selected, by default `false`.
     */
    public init(
        selectedFontName: Binding<String>,
        fonts: [SystemFontPickerFont] = .all,
        itemFontSize: CGFloat = 20,
        dismissAfterPick: Bool = false
    ) {
        self._selectedFontName = selectedFontName
        self.fonts = fonts
        self.itemFontSize = itemFontSize
        self.dismissAfterPick = dismissAfterPick
    }
    
    private let fonts: [SystemFontPickerFont]
    private let itemFontSize: CGFloat
    private let dismissAfterPick: Bool
    
    @Binding
    private var selectedFontName: String
    
    public var body: some View {
        let font = Binding(
            get: { SystemFontPickerFont(fontName: selectedFontName) },
            set: { selectedFontName = $0.fontName }
        )
        
        ForEachPicker(
            items: fonts,
            selection: font,
            dismissAfterPick: dismissAfterPick
        ) { font, isSelected in
            SystemFontPickerItem(
                font: font,
                fontSize: itemFontSize,
                isSelected: isSelected)
        }
    }
}

#if os(iOS)
struct SystemFontForEachPicker_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State private var font = ""
        
        var body: some View {
            NavigationView {
                List {
                    SystemFontForEachPicker(
                        selectedFontName: $font)
                }
            }
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
#endif
