//
//  ListSelectItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view wraps the provided content within an `HStack` and
 adds a trailing image if the view is selected.

 Although the `selectedImage` is a checkmark by default, the
 selection indicator view can be any custom view.
 */
public struct ListSelectItem<Content: View, SelectIndicator: View>: View {

    /**
     Create a list select item.

     - Parameters:
       - isSelected: Whether or not the item is selected.
       - selectIndicator: The view to show for selected views.
       - content: The list item content view.
     */
    public init(
        isSelected: Bool,
        selectIndicator: SelectIndicator,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.isSelected = isSelected
        self.selectedIndicator = selectIndicator
        self.content = content
    }

    /**
     Create a list select item.

     - Parameters:
       - isSelected: Whether or not the item is selected.
       - selectedImage: The image to show for selected views, by default `.checkmark`.
       - content: The list item content view.
     */
    public init(
        isSelected: Bool,
        selectedImage: Image = Image(systemName: "checkmark"),
        @ViewBuilder content: @escaping () -> Content
    ) where SelectIndicator == Image {
        self.isSelected = isSelected
        self.selectedIndicator = selectedImage
        self.content = content
    }
    
    private let isSelected: Bool
    private let selectedIndicator: SelectIndicator
    private let content: () -> Content
    
    public var body: some View {
        HStack {
            content()
            Spacer()
            if isSelected {
                selectedIndicator
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
                            selectIndicator: Image(systemName: "checkmark.circle.fill")
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
