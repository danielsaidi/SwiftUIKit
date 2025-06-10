//
//  ForEachMultiPicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-20.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
public struct ForEachMultiPicker<Item: Identifiable, ItemView: View>: View {
    
    /// Create a for-each multi-picker.
    ///
    /// - Parameters:
    ///   - items: The items to list in the picker.
    ///   - selection: The current selection.
    ///   - listItem: A list view builder.
    public init(
        items: [Item],
        selection: Binding<[Item]>,
        listItem: @escaping ItemViewBuilder
    ) {
        self.items = items
        self.selection = selection
        self.listItem = listItem
    }
    
    private let items: [Item]
    private let selection: Binding<[Item]>
    private let listItem: ItemViewBuilder
    
    public typealias ItemViewBuilder = (_ item: Item, _ isSelected: Bool) -> ItemView
    
    @Environment(\.dismiss)
    public var dismiss
    
    public var body: some View {
        ForEach(items) { item in
            Button(action: { toggleSelection(for: item) }, label: {
                listItem(item, isSelected(item))
            })
        }
    }
    
    var selectedIds: [Item.ID] {
        selection.wrappedValue.map { $0.id }
    }
    
    func isSelected(_ item: Item) -> Bool {
        selectedIds.contains(item.id)
    }
    
    func toggleSelection(for item: Item) {
        if isSelected(item) {
            selection.wrappedValue = selection.wrappedValue.filter { $0.id != item.id }
        } else {
            selection.wrappedValue.append(item)
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
