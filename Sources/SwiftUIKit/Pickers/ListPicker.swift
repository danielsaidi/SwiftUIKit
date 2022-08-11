//
//  ListPicker.swift
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
 
 If `dismissAfterPick` is `true` the picker dismisses itself
 automatically when an item is picked. This is nice when the
 picker is used in e.g. a sheet.
 */
public struct ListPicker<Item: Identifiable, ItemView: View>: View, DismissableView {
    
    /**
     Create a list picker with a single section.
     
     - Parameters:
       - items: The items to display in the picker.
       - selection: The picker selection.
       - animatedSelection: Whether or not to animate selection changes.
       - dismissAfterPick: Whether or not to dismiss the picker after a font has been selected, by default `false`.
       - listItem: A view builder for each picker item.
     */
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
    
    /**
     Create a list picker with multiple sections.
     
     - Parameters:
       - sections: The item sections to display in the picker.
       - selection: The picker selection.
       - animatedSelection: Whether or not to animate selection changes.
       - dismissAfterPick: Whether or not to dismiss the picker after a font has been selected, by default `false`.
       - listItem: A view builder for each picker item.
     */
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
    
    @Environment(\.presentationMode) public var presentationMode
    
    public var body: some View {
        List {
            ForEach(sections) { section in
                Section(header: section.header) {
                    ForEachPicker(
                        items: section.items,
                        selection: selection,
                        animatedSelection: animatedSelection,
                        dismissAfterPick: dismissAfterPick,
                        listItem: listItem)
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

#if os(iOS)
struct ListPicker_Previews: PreviewProvider {
    
    static var previews: some View {
        Preview()
    }
    
    struct Preview: View {
        
        @State private var selection = PreviewItem.all[0]
        
        func section(_ title: String) -> ListPickerSection<PreviewItem> {
            ListPickerSection(title: title, items: PreviewItem.all)
        }
        
        var body: some View {
            NavigationView {
                ListPicker(
                    sections: [
                        section(""),
                        section("Another section")
                    ],
                    selection: $selection) { item, isSelected in
                        ListSelectItem(isSelected: isSelected) {
                            Text(item.name)
                        }
                    }.withTitle("Pick an item")
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
}
#endif
