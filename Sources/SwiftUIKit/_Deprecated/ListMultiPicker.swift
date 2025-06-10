//
//  ListMultiPicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-20.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
public struct ListMultiPicker<Item: Identifiable, ItemView: View>: View {
    
    /// Create a list picker.
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
        self.init(
            sections: [ListPickerSection(title: "", items: items)],
            selection: selection,
            listItem: listItem
        )
    }
    
    /// Create a list picker with multiple sections.
    ///
    /// - Parameters:
    ///   - sections: The sections to list in the picker.
    ///   - selection: The current selection.
    ///   - listItem: A list view builder.
    public init(
        sections: [ListPickerSection<Item>],
        selection: Binding<[Item]>,
        listItem: @escaping ItemViewBuilder
    ) {
        self.sections = sections
        self.selection = selection
        self.listItem = listItem
    }
    
    private let sections: [ListPickerSection<Item>]
    private let selection: Binding<[Item]>
    private let listItem: ItemViewBuilder
    
    public typealias ItemViewBuilder = (_ item: Item, _ isSelected: Bool) -> ItemView
    
    @Environment(\.dismiss)
    public var dismiss
    
    public var body: some View {
        List {
            ForEach(sections) { section in
                Section(header: section.header) {
                    ForEachMultiPicker(
                        items: section.items,
                        selection: selection,
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
