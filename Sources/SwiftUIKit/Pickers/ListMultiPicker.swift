//
//  ListMultiPicker.swift
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
 the provided `listItem` to build an item view for each item.
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
                    ForEachMultiPicker(
                        items: section.items,
                        selection: selection,
                        listItem: listItem)
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
            NavigationView {
                ListMultiPicker(
                    title: "Pick multiple items",
                    sections: [
                        section(""),
                        section("Another section")
                    ],
                    selection: $selection) { item, isSelected in
                        ListSelectItem(isSelected: isSelected) {
                            Text(item.name)
                        }
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
}
