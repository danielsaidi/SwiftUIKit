//
//  CollectionViewRow.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-10.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS)
/**
 This struct represents a row in a ``CollectionView``.
 
 Credits to `@defagos`, who created this as part of his work
 to bring amazing, performant collection views to `SwiftUI`:
 https://github.com/defagos/SwiftUICollection
 */
public struct CollectionViewRow<Section: Hashable, Item: Hashable>: Hashable {
    
    public let section: Section
    public let items: [Item]
    
    public init(section: Section, items: [Item]) {
        self.section = section
        self.items = items
    }
}
#endif
