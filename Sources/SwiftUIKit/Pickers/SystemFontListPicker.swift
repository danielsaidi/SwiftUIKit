//
//  SystemFontListPicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-23.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This system font picker renders a `List` that iterates over
 a collection of fonts, of which one can be selected.
 
 The reason why this is not just a regular `Picker`, is that
 regular pickers don't show custom fonts.
 
 If you don't want a `List`, use a `SystemFontForEachPicker`
 instead, which just renders font items within a `ForEach`.
 */
public struct SystemFontListPicker: View {
    
    /**
     Create a font list picker.
     
     - Parameters:
       - title: The list's navigation title.
       - selectedFontName: The selected font name.
       - fonts: The fonts to display in the list, by default `all` with the selected font topmost.
       - itemFontSize: The font size to use in the list items.
       - dismissAfterPick: Whether or not to dismiss the picker after a font has been selected, by default `true`.
     */
    public init(
        title: String,
        selectedFontName: Binding<String>,
        fonts: [SystemFontPickerFont]? = nil,
        itemFontSize: CGFloat = 20,
        dismissAfterPick: Bool = true) {
        self.title = title
        self._selectedFontName = selectedFontName
        self.fonts = fonts ?? .all.moveTopmost(selectedFontName.wrappedValue)
        self.itemFontSize = itemFontSize
        self.dismissAfterPick = dismissAfterPick
    }
    
    private let title: String
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
        
        ListPicker(
            title: title,
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


struct SystemFontListPicker_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State private var font = ""
        
        var body: some View {
            NavigationView {
                SystemFontListPicker(
                    title: "Pick a font",
                    selectedFontName: $font)
            }
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
