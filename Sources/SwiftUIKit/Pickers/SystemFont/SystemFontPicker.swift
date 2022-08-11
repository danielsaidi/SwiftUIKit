//
//  SystemFontPicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-17.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This system font picker renders a plain `Picker` view, that
 lists a collection of fonts, of which one can be selected.
 
 Note that some platforms don't render custom fonts for some
 picker styles. If so, you can use the `SystemFontListPicker`
 or `SystemFontForEachPicker` to customize the picker design.
 */
public struct SystemFontPicker: View {
    
    /**
     Create a font picker.
     
     - Parameters:
       - selectedFontName: The selected font name.
       - fonts: The fonts to display in the list, by default `all` with the selected font topmost.
       - itemFontSize: The font size to use in the list items.
     */
    public init(
        selectedFontName: Binding<String>,
        fonts: [SystemFontPickerFont] = .all,
        itemFontSize: CGFloat = 20
    ) {
        self._selectedFontName = selectedFontName
        self.fonts = fonts
        self.itemFontSize = itemFontSize
        self.selectedFont = fonts.last { $0.matches(selectedFontName.wrappedValue) }
    }
    
    private let fonts: [SystemFontPickerFont]
    private let itemFontSize: CGFloat
    private let selectedFont: SystemFontPickerFont?
    
    @Binding
    private var selectedFontName: String
    
    public var body: some View {
        Picker(selection: $selectedFontName) {
            ForEach(fonts) { font in
                SystemFontPickerItem(
                    font: font,
                    fontSize: itemFontSize,
                    isSelected: false)
                .tag(font.tag(for: selectedFont, selectedName: selectedFontName))
            }
        } label: {
            EmptyView()
        }
    }
}

private extension SystemFontPickerFont {
    
    /**
     A system font has a font name that may be resolved to a
     different font name when it's picked. We must therefore
     do our best to pattern match the available fonts to the
     currently selected font name.
     */
    func matches(_ selectedFontName: String) -> Bool {
        let system = SystemFontPickerFont.systemFontNamePrefix.lowercased()
        let selected = selectedFontName.lowercased()
        let fontName = self.fontName.lowercased()
        if fontName.isEmpty { return system == selected }
        if fontName == selected { return true }
        if selected.hasPrefix(fontName.replacingOccurrences(of: " ", with: "")) { return true }
        if selected.hasPrefix(fontName.replacingOccurrences(of: " ", with: "-")) { return true }
        return false
    }
    
    /**
     Use the selected font name as tag for the selected font.
     */
    func tag(
        for selectedFont: SystemFontPickerFont?,
        selectedName: String
    ) -> String {
        let isSelected = fontName == selectedFont?.fontName
        return isSelected ? selectedName : fontName
    }
}

struct SystemFontPicker_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State private var font = ""
        
        var body: some View {
            SystemFontPicker(selectedFontName: $font)
                .withStyle()
                .padding(20)
        }
    }
    
    static var previews: some View {
        Preview()
    }
}

private extension View {
    
    @ViewBuilder
    func withStyle() -> some View {
        #if os(iOS) || os(macOS)
        if #available(iOS 14.0, macOS 12.0, *) {
            self.pickerStyle(.menu)
        } else {
            self
        }
        #else
        self
        #endif
    }
}
