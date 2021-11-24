//
//  MultiPicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-20.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This generic picker lists `Identifiable` items in a SwiftUI
 `List` and binds its `selection` to an external value.
 
 You can use this view instead of the native SwiftUI `Picker`
 to get more control over the list item views. The view uses
 the `listItem` function to build an item view for each item
 in the provided `items` or `sections`.
 */
public struct ListMultiPicker<Item: Identifiable, ItemView: View>: View, DismissableView {
    
    /**
     Create a picker with a single section.
     */
    public init(
        title: String,
        items: [Item],
        selection: Binding<[Item]>,
        listItem: @escaping ItemViewBuilder) {
        self.init(
            title: title,
            sections: [ListPickerSection(title: "", items: items)],
            selection: selection,
            listItem: listItem)
    }
    
    /**
     Create a picker with multiple sections.
     */
    public init(
        title: String,
        sections: [ListPickerSection<Item>],
        selection: Binding<[Item]>,
        listItem: @escaping ItemViewBuilder) {
        self.title = title
        self.sections = sections
        self.selection = selection
        self.listItem = listItem
    }
    
    private let title: String
    private let sections: [ListPickerSection<Item>]
    private let selection: Binding<[Item]>
    private let listItem: ItemViewBuilder
    
    public typealias ItemViewBuilder = (_ item: Item, _ isSelected: Bool) -> ItemView
    
    @Environment(\.presentationMode) public var presentationMode
    
    public var body: some View {
        List {
            ForEach(sections) { section in
                Section(header: section.header) {
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

private extension ListMultiPicker {
    
    func listItemView(for item: Item) -> some View {
        Button(action: { toggleSelection(for: item) }, label: {
            listItem(item, isSelected(item))
        })
    }
}

private extension ListMultiPicker {
    
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

struct ListMultiPicker_Previews: PreviewProvider {
    
    static var previews: some View {
        Preview()
    }
    
    struct Preview: View {
        
        @State private var selection = [PreviewItem.all[0]]
        
        func section(_ title: String) -> ListPickerSection<PreviewItem> {
            ListPickerSection(
                title: title,
                items: PreviewItem.all)
        }
        
        var body: some View {
            ListMultiPicker(
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
            PreviewItem(name: "Item #5"),
            PreviewItem(name: "Item #6"),
            PreviewItem(name: "Item #7"),
            PreviewItem(name: "Item #8"),
            PreviewItem(name: "Item #9"),
            PreviewItem(name: "Item #10"),
            PreviewItem(name: "Item #11"),
            PreviewItem(name: "Item #12"),
            PreviewItem(name: "Item #13"),
            PreviewItem(name: "Item #14"),
            PreviewItem(name: "Item #15")
        ]
    }

    struct PreviewPickerItem: View, ListPickerItem {
        
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
