//
//  Picker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-20.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This picker view lists an `Identifiable` item collection in
 a `List` and binds its `selection` to an external value.
 
 The picker uses the provided `listItem` builder to build an
 item view for each item in the provided `items` collection.
 
 If `dismissAfterPick` is `true` the picker dismisses itself
 automatically when an item is picked.
 */
public struct Picker<Item: Identifiable, ItemView: View>: View, DismissableView {
    
    public init(
        title: String,
        items: [Item],
        selection: Binding<Item>,
        dismissAfterPick: Bool = true,
        listItem: @escaping ItemViewBuilder) {
        self.title = title
        self.sections = [PickerSection(title: "", items: items)]
        self.selection = selection
        self.dismissAfterPick = dismissAfterPick
        self.listItem = listItem
    }
    
    public init(
        title: String,
        sections: [PickerSection<Item>],
        selection: Binding<Item>,
        dismissAfterPick: Bool = true,
        listItem: @escaping ItemViewBuilder) {
        self.title = title
        self.sections = sections
        self.selection = selection
        self.dismissAfterPick = dismissAfterPick
        self.listItem = listItem
    }
    
    private let title: String
    private let sections: [PickerSection<Item>]
    private let selection: Binding<Item>
    private let dismissAfterPick: Bool
    private let listItem: ItemViewBuilder
    
    public typealias ItemViewBuilder = (_ item: Item, _ isSelected: Bool) -> ItemView
    
    @Environment(\.presentationMode) public var presentationMode
    
    public var body: some View {
        List {
            ForEach(sections) { section in
                Section(header: section.pickerHeader) {
                    ForEach(section.items) {
                        listItemView(for: $0)
                    }
                }
            }.withTitle(title)
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

private extension Picker {
    
    func listItemView(for item: Item) -> some View {
        Button(action: { select(item) }, label: {
            listItem(item, isSelected(item))
        })
    }
}

private extension Picker {
    
    var seletedId: Item.ID {
        selection.wrappedValue.id
    }
    
    func isSelected(_ item: Item) -> Bool {
        seletedId == item.id
    }
    
    func select(_ item: Item) {
        selection.wrappedValue = item
        if dismissAfterPick {
            dismiss()
        }
    }
}

#if os(iOS) || os(tvOS)
struct Picker_Previews: PreviewProvider {
    
    static var previews: some View {
        Preview()
    }
    
    struct Preview: View {
        
        @State private var selection = PreviewItem.all[0]
        
        func section(_ title: String) -> PickerSection<PreviewItem> {
            PickerSection(title: title, items: PreviewItem.all)
        }
        
        var body: some View {
            NavigationView {
                Picker(
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
#endif
