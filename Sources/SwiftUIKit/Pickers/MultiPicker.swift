//
//  MultiPicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-20.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This picker view lists an `Identifiable` item collection in
 a `MenuList` and binds its `selection` to an external value.
 
 The picker uses the provided `listItem` builder to build an
 item view for each item in the provided `items` collection.
 */
public struct MultiPicker<Item: Identifiable, ItemView: View>: View, DismissableView {
    
    public init(
        title: String,
        items: [Item],
        selection: Binding<[Item]>,
        listItem: @escaping ItemViewBuilder) {
        self.title = title
        self.sections = [PickerSection(title: "", items: items)]
        self.selection = selection
        self.listItem = listItem
    }
    
    public init(
        title: String,
        sections: [PickerSection<Item>],
        selection: Binding<[Item]>,
        listItem: @escaping ItemViewBuilder) {
        self.title = title
        self.sections = sections
        self.selection = selection
        self.listItem = listItem
    }
    
    private let title: String
    private let sections: [PickerSection<Item>]
    private let selection: Binding<[Item]>
    private let listItem: ItemViewBuilder
    
    public typealias ItemViewBuilder = (_ item: Item, _ isSelected: Bool) -> ItemView
    
    @Environment(\.presentationMode) public var presentationMode
    
    public var body: some View {
        MenuList(title) {
            ForEach(sections) { section in
                Section(header: section.pickerHeader) {
                    ForEach(section.items) {
                        listItemView(for: $0)
                    }
                }
            }
        }.withTitle(title)
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

private extension MultiPicker {
    
    func listItemView(for item: Item) -> some View {
        Button(action: { toggleSelection(for: item) }) {
            listItem(item, isSelected(item))
        }
    }
}

private extension MultiPicker {
    
    var seletedIds: [Item.ID] {
        selection.wrappedValue.map { $0.id }
    }
    
    func isSelected(_ item: Item) -> Bool {
        seletedIds.contains(item.id)
    }
    
    func toggleSelection(for item: Item) {
        if isSelected(item) {
            selection.wrappedValue = selection.wrappedValue.filter { $0.id != item.id }
        } else {
            selection.wrappedValue.append(item)
        }
    }
}

struct MultiPicker_Previews: PreviewProvider {
    
    static var previews: some View {
        Preview()
    }
    
    struct Preview: View {
        
        @State private var selection = [PreviewItem.all[0]]
        
        func section(_ title: String) -> PickerSection<PreviewItem> {
            PickerSection(title: title, items: PreviewItem.all)
        }
        
        var body: some View {
            MultiPicker(
                title: "Pick something",
                sections: [
                    section(""),
                    section("Another section")
                ],
                selection: $selection) { item, isSelected in
                    PreviewPickerItem(item: item, isSelected: isSelected)
                }
        }
    }
    
    struct PreviewItem: Identifiable, Equatable {
        
        let name: String
        
        var id: String { name }
        
        static let all = [
            PreviewItem(name: "Item #1"),
            PreviewItem(name: "Item #2"),
            PreviewItem(name: "Item #3"),
            PreviewItem(name: "Item #4"),
            PreviewItem(name: "Item #5")
        ]
    }

    struct PreviewPickerItem: View, PickerListItem {
        
        let item: PreviewItem
        let isSelected: Bool
        
        var body: some View {
            HStack {
                Text(item.name)
                Spacer()
                checkmark
            }
        }
    }

}
