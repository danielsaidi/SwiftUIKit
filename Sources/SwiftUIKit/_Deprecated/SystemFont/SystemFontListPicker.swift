//
//  SystemFontListPicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-23.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
public struct SystemFontListPicker: View {
    
    /// Create a font list picker.
    ///
    /// - Parameters:
    ///   - selectedFontName: The selected font name.
    ///   - fonts: The fonts to display in the list, by default `all`.
    ///   - itemFontSize: The font size to apply, by default `20`.
    ///   - dismissAfterPick: Whether or not to dismiss the picker after picking, by default `false`.
    public init(
        selectedFontName: Binding<String>,
        fonts: [SystemFontPickerFont]? = nil,
        itemFontSize: CGFloat = 20,
        dismissAfterPick: Bool = true
    ) {
        self._selectedFontName = selectedFontName
        self.fonts = fonts ?? .all.moveTopmost(selectedFontName.wrappedValue)
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
        
        ListPicker(
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

private extension View {
    
    @ViewBuilder
    func withTitle(_ title: String) -> some View {
        #if os(iOS) || os(tvOS) || os(watchOS)
        self.navigationBarTitle(title)
        #else
        self
        #endif
    }
}
