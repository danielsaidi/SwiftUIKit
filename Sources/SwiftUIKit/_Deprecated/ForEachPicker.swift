//
//  ForEachPicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-17.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
public struct ForEachPicker<Item: Identifiable, ItemView: View>: View {
    
    /// Create a for-each picker.
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
        dismissAfterPick: Bool = false,
        listItem: @escaping ItemViewBuilder
    ) {
        self.items = items
        self.selection = selection
        self.animatedSelection = animatedSelection
        self.dismissAfterPick = dismissAfterPick
        self.listItem = listItem
    }
    
    private let items: [Item]
    private let selection: Binding<Item>
    private let animatedSelection: Bool
    private let dismissAfterPick: Bool
    private let listItem: ItemViewBuilder
    
    public typealias ItemViewBuilder = (_ item: Item, _ isSelected: Bool) -> ItemView
    
    @Environment(\.dismiss)
    public var dismiss
    
    public var body: some View {
        ForEach(items) { item in
            Button(action: { select(item) }, label: {
                listItem(item, isSelected(item))
            })
        }
    }
    
    var selectedId: Item.ID {
        selection.wrappedValue.id
    }
    
    func isSelected(_ item: Item) -> Bool {
        selectedId == item.id
    }
    
    func select(_ item: Item) {
        if animatedSelection {
            selectWithAnimation(item)
        } else {
            selectWithoutAnimation(item)
        }
    }
    
    func selectWithAnimation(_ item: Item) {
        withAnimation {
            selectWithoutAnimation(item)
        }
    }
    
    func selectWithoutAnimation(_ item: Item) {
        selection.wrappedValue = item
        if dismissAfterPick {
            dismiss()
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
