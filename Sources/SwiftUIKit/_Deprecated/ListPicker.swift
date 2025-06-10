//
//  ListPicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-20.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
public struct ListPicker<Item: Identifiable, ItemView: View>: View {
    
    /// Create a list picker.
    ///
    /// - Parameters:
    ///   - items: The items to list in the picker.
    ///   - selection: The current selection.
    ///   - animatedSelection: Whether or not to animate selections, by default `false`.
    ///   - dismissAfterPick: Whether or not to dismiss the picker after picking, by default `false`.
    ///   - listItem: A list view builder.
    public init(
        items: [Item],
        selection: Binding<Item>,
        animatedSelection: Bool = false,
        dismissAfterPick: Bool = true,
        listItem: @escaping ItemViewBuilder
    ) {
        self.init(
            sections: [ListPickerSection(title: "", items: items)],
            selection: selection,
            animatedSelection: animatedSelection,
            dismissAfterPick: dismissAfterPick,
            listItem: listItem)
    }
    
    /// Create a list picker with multiple sections.
    ///
    /// - Parameters:
    ///   - sections: The sections to render.
    ///   - selection: The selection binding.   
    ///   - animatedSelection: Whether or not to animate selections, by default `false`.
    ///   - dismissAfterPick: Whether or not to dismiss the picker after picking, by default `false`.
    ///   - listItem: A list view builder.
    public init(
        sections: [ListPickerSection<Item>],
        selection: Binding<Item>,
        animatedSelection: Bool = false,
        dismissAfterPick: Bool = true,
        listItem: @escaping ItemViewBuilder
    ) {
        self.sections = sections
        self.selection = selection
        self.animatedSelection = animatedSelection
        self.dismissAfterPick = dismissAfterPick
        self.listItem = listItem
    }
    
    private let sections: [ListPickerSection<Item>]
    private let selection: Binding<Item>
    private let animatedSelection: Bool
    private let dismissAfterPick: Bool
    private let listItem: ItemViewBuilder
    
    public typealias ItemViewBuilder = (_ item: Item, _ isSelected: Bool) -> ItemView
    
    @Environment(\.dismiss)
    public var dismiss
    
    public var body: some View {
        List {
            ForEach(sections) { section in
                Section(header: section.header) {
                    ForEachPicker(
                        items: section.items,
                        selection: selection,
                        animatedSelection: animatedSelection,
                        dismissAfterPick: dismissAfterPick,
                        listItem: listItem
                    )
                }
            }
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
