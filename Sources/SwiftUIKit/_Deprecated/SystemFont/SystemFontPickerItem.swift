//
//  SystemFontPickerItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-17.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
public struct SystemFontPickerItem: View {
    
    public init(
        font: SystemFontPickerFont,
        fontSize: CGFloat = 20,
        isSelected: Bool
    ) {
        self.font = font
        self.fontSize = fontSize
        self.isSelected = isSelected
    }
    
    private let font: SystemFontPickerFont
    private let fontSize: CGFloat
    private let isSelected: Bool
    
    public var body: some View {
        ListSelectItem(isSelected: isSelected) {
            Text(font.fontDisplayName)
                .font(.custom(font.fontName, size: fontSize))
        }
    }
}
