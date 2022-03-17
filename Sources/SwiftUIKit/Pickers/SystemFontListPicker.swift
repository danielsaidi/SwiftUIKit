//
//  SystemFontListPicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-23.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This picker can be used to pick a system font with a `List`.
 
 The reason why this is a list picker and not just a regular
 SwiftUI `Picker`, is that a regular picker doesn't show the
 custom font for each list item.
 */
public struct SystemFontListPicker: View {
    
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
        self.fonts = .all.moveTopmost(selectedFontName.wrappedValue)
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
    private let fonts: [SystemFontPickerFont]
    
    
    public var body: some View {
        let font = Binding(
            get: { SystemFontPickerFont(fontName: selectedFontName) },
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


#if os(iOS) || os(tvOS)
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
#endif
