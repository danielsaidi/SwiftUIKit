//
//  SystemFontForEachPicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-17.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
public struct SystemFontForEachPicker: View {
    
    /// Create a font list picker.
    ///
    /// - Parameters:
    ///   - selectedFontName: The selected font name.
    ///   - fonts: The fonts to display in the list, by default `all`.
    ///   - itemFontSize: The font size to apply, by default `20`.
    ///   - dismissAfterPick: Whether or not to dismiss the picker after picking, by default `false`.
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
