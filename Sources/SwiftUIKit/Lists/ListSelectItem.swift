//
//  ListSelectItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This view wraps the provided content view in an `HStack` and adds a custom
/// `selectIndicator` to the trailing edge if the item is selected.
public struct ListSelectItem<Content: View, SelectIndicator: View>: View {

    /// Create a list select item with a custom selection indicator view.
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

    /// Create a list select item with a custom selection indicator image.
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

#Preview {
    
    struct Preview: View {
        
        @State
        private var selection = 0
        
        var body: some View {
            List {
                ForEach(0...10, id: \.self) { index in
                    Group {
                        ListSelectItem(isSelected: index == selection) {
                            Image.symbol("\(index).circle")
                                .label(
                                    "Preview.Item.\(index)",
                                    bundle: .module
                                )
                        }
                        ListSelectItem(
                            isSelected: index == selection,
                            selectionIndicator: Image(
                                systemName: "checkmark.circle.fill"
                            )
                            .foregroundColor(.green)
                        ) {
                            Image.symbol("\(index).circle")
                                .label("Preview.Item.\(index)", bundle: .module)
                        }
                    }
                    #if os(iOS) || os(macOS) || os(visionOS)
                    .onTapGesture {
                        selection = index
                    }
                    #endif
                }
            }
        }
    }
    
    return Preview()
}
