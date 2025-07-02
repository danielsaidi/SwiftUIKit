//
//  SystemFontPicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-17.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
public struct SystemFontPicker: View {
    
    /// Create a font picker.
    ///
    /// - Parameters:
    ///   - selectedFontName: The selected font name.
    ///   - fonts: The fonts to display in the list, by default `all`.
    ///   - itemFontSize: The font size to apply, by default `20`.
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

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
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
