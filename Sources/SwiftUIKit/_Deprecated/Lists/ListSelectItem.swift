//
//  ListSelectItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to the new ListKit library.")
public struct ListSelectItem<Content: View, SelectIndicator: View>: View {

    /// Create an item with a custom indicator view.
    ///
    /// - Parameters:
    ///   - isSelected: Whether or not the item is selected.
    ///   - selectionIndicator: The view to show for selected views.
    ///   - content: The list item content view.
    public init(
        isSelected: Bool,
        selectionIndicator: SelectIndicator,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.isSelected = isSelected
        self.selectionIndicator = selectionIndicator
        self.content = content
    }

    /// Create an item with a custom indicator image.
    ///
    /// - Parameters:
    ///   - isSelected: Whether or not the item is selected.
    ///   - selectionIndicatorImage: The image to show for selected views, by default `.checkmark`.
    ///   - content: The list item content view.
    public init(
        isSelected: Bool,
        selectionIndicatorImage: Image = Image(systemName: "checkmark"),
        @ViewBuilder content: @escaping () -> Content
    ) where SelectIndicator == Image {
        self.init(
            isSelected: isSelected,
            selectionIndicator: selectionIndicatorImage,
            content: content
        )
    }

    @available(*, deprecated, renamed: "init(isSelected:selectionIndicator:content:)")
    public init(
        isSelected: Bool,
        selectIndicator: SelectIndicator,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.init(
            isSelected: isSelected,
            selectionIndicator: selectIndicator,
            content: content
        )
    }

    @available(*, deprecated, renamed: "init(isSelected:selectionIndicatorImage:content:)")
    public init(
        isSelected: Bool,
        selectedImage: Image,
        @ViewBuilder content: @escaping () -> Content
    ) where SelectIndicator == Image {
        self.init(
            isSelected: isSelected,
            selectionIndicatorImage: selectedImage,
            content: content
        )
    }

    private let isSelected: Bool
    private let selectionIndicator: SelectIndicator
    private let content: () -> Content
    
    public var body: some View {
        HStack {
            content()
            Spacer()
            if isSelected {
                selectionIndicator
            }
        }
    }
}
