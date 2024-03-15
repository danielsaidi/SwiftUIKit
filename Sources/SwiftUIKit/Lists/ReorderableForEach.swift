//
//  ReorderableForEach.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-08-30.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//
//  Original implementations: https://stackoverflow.com/questions/62606907/swiftui-using-ondrag-and-ondrop-to-reorder-items-within-one-single-lazygrid
//

#if os(iOS) || os(macOS)
import SwiftUI

/**
 This type represents a reorderable item that can be used in
 a ``ReorderableForEach`` view.
 */
public typealias Reorderable = Identifiable & Equatable

/**
 This view can be used instead of a `ForEach`, to let a user
 reorder the items by dragging.
 
 You can for instance add this view to a `LazyVGrid` that is
 wrapped in a `ScrollView`:
 
 ```swift
 struct GridData: Identifiable, Equatable {
     let id: Int
 }
 
 struct ContentView {
 
     @State
     private var items = (1...100).map { GridData(id: $0) }
     
     @State
     private var active: GridData?
 
     var body: some View {
         ScrollView(.vertical) {
             VStack {
                 LazyVGrid(columns: .adaptive(minimum: 100, maximum: 150)) {
                     ReorderableForEach(items, active: $active) { item in
                         shape
                             .fill(.white.opacity(0.5))
                             .frame(height: 100)
                             .overlay(Text("\(item.id)"))
                             .contentShape(.dragPreview, shape)
                     } preview: { item in
                         Color.white
                             .frame(width: 200, height: 200)
                             .overlay(Text("\(item.id)"))
                             .contentShape(.dragPreview, shape)
                     } moveAction: { from, to in
                         items.move(fromOffsets: from, toOffset: to)
                     }
                 }
             }.padding()
         }
         .background(Color.blue.gradient)
         .scrollContentBackground(.hidden)
         .reorderableForEachContainer(active: $active)
     }
 
     var shape: some Shape {
         RoundedRectangle(cornerRadius: 40)
     }
 }
 ```
 
 Providing a `preview` is optional. If you don't provide one,
 the original item view will be used.
 
 The `.reorderableForEachContainer` modifier must be applied
 to the outmost container view, to ensure that ending a drag
 operation outside the list still works.
 
 > Note: This view doesn't work well in a simulator. It will
 not show the drag preview and randomly cancel drag gestures.
 Also, using a material background will cause a dragged view
 to flicker black.
 */
public struct ReorderableForEach<Item: Reorderable, Content: View, Preview: View>: View {
    
    /**
     Create a reorderable list with a custom drag preview.
     */
    public init(
        _ items: [Item],
        active: Binding<Item?>,
        @ViewBuilder content: @escaping (Item) -> Content,
        @ViewBuilder preview: @escaping (Item) -> Preview,
        moveAction: @escaping (IndexSet, Int) -> Void
    ) {
        self.items = items
        self._active = active
        self.content = content
        self.preview = preview
        self.moveAction = moveAction
    }
    
    /**
     Create a reorderable list with a standard drag preview.
     */
    public init(
        _ items: [Item],
        active: Binding<Item?>,
        @ViewBuilder content: @escaping (Item) -> Content,
        moveAction: @escaping (IndexSet, Int) -> Void
    ) where Preview == EmptyView {
        self.items = items
        self._active = active
        self.content = content
        self.preview = nil
        self.moveAction = moveAction
    }
    
    @Binding
    private var active: Item?
    
    /**
     This hack is needed to reset view opaqueness when items
     are dragged but not moved. Without it, items would stay
     semi-transparent when the drag gesture ends.
     */
    @State
    private var hasChangedLocation = false
    
    private let items: [Item]
    private let content: (Item) -> Content
    private let preview: ((Item) -> Preview)?
    private let moveAction: (IndexSet, Int) -> Void
    
    public var body: some View {
        ForEach(items) { item in
            if let preview {
                contentView(for: item)
                    .onDrag {
                        dragData(for: item)
                    } preview: {
                        preview(item)
                    }
            } else {
                contentView(for: item)
                    .onDrag {
                        dragData(for: item)
                    }
            }
        }
    }
}

private extension ReorderableForEach {
    
    func contentView(for item: Item) -> some View {
        content(item)
            .opacity(active == item && hasChangedLocation ? 0.5 : 1)
            .onDrop(
                of: [.text],
                delegate: ReorderableDragRelocateDelegate(
                    item: item,
                    items: items,
                    active: $active,
                    hasChangedLocation: $hasChangedLocation
                ) { from, to in
                    withAnimation {
                        moveAction(from, to)
                    }
                }
            )
    }
    
    func dragData(for item: Item) -> NSItemProvider {
        active = item
        return NSItemProvider(object: "\(item.id)" as NSString)
    }
}

public extension View {
    
    /**
     Apply the modifier to the root view of a view hierarchy
     that contains a ``ReorderableForEach`` view, to make it
     end an reorder drag gesture when it ends outside of the
     drag source view.
     */
    func reorderableForEachContainer<Item: Reorderable>(active: Binding<Item?>) -> some View {
        onDrop(of: [.text], delegate: ReorderableDropOutsideDelegate(active: active))
    }
}

struct ReorderableDropOutsideDelegate<Item: Reorderable>: DropDelegate {
    
    @Binding
    var active: Item?
        
    func dropUpdated(info: DropInfo) -> DropProposal? {
        DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        active = nil
        return true
    }
}

struct ReorderableDragRelocateDelegate<Item: Reorderable>: DropDelegate {
    
    let item: Item
    var items: [Item]
    
    @Binding
    var active: Item?
    
    @Binding
    var hasChangedLocation: Bool

    var moveAction: (IndexSet, Int) -> Void

    func dropEntered(info: DropInfo) {
        guard item != active, let current = active else { return }
        guard let from = items.firstIndex(of: current), let to = items.firstIndex(of: item) else { return }
        
        hasChangedLocation = true

        if items[to] != current {
            moveAction(IndexSet(integer: from), to > from ? to + 1 : to)
        }
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        hasChangedLocation = false
        active = nil
        return true
    }
}

#Preview {
    
    struct Preview: View {
        
        @State
        private var items = (1...100).map { GridData(id: $0) }
        
        @State
        private var active: GridData?
        
        private struct GridData: Identifiable, Equatable {
            
            let id: Int
        }
         
        var body: some View {
            NavigationView {
                #if os(macOS)
                Color.gray
                #endif
                if #available(iOS 16.0, *) {
                    ScrollView(.vertical) {
                        VStack {
                            LazyVGrid(columns: .adaptive(minimum: 100, maximum: 150)) {
                                ReorderableForEach(items, active: $active) { item in
                                    shape
                                        .fill(.thinMaterial)
                                        .frame(height: 100)
                                        .overlay(Text("\(item.id)"))
                                        .contentShape(.dragPreview, shape)
                                } preview: { item in
                                    shape
                                        .frame(width: 200, height: 200)
                                        .overlay(Text("\(item.id)"))
                                        .contentShape(.dragPreview, shape)
                                } moveAction: { from, to in
                                    items.move(fromOffsets: from, toOffset: to)
                                }
                            }
                        }.padding()
                    }
                    #if os(iOS)
                    .background(Color.blue)
                    .scrollContentBackground(.hidden)
                    #else
                    .background(Color.blue)
                    #endif
                    .reorderableForEachContainer(active: $active)
                } else {
                    // Fallback on earlier versions
                }
            }
        }
        
        var shape: some Shape {
            RoundedRectangle(cornerRadius: 20)
        }
    }
    
    return Preview()
}

#endif
