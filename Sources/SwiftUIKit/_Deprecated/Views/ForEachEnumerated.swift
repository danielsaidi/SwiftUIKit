//
//  ForEachEnumerated.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-02.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used on any collection, and will enumerate
 the provided collection instead of requiring the collection
 item type to be `Identifiable`.

 `IMPORTANT` Only use this when collections should be listed
 in order. This will not consider any identifying properties
 of the list items, which can cause SwiftUI rendering issues.
 */
@available(*, deprecated, message: "Use Collection+EnumeratedArray instead.")
public struct ForEachEnumerated<CollectionType: Collection, ViewType: View>: View {
    
    public init(_ collection: CollectionType, content: @escaping ContentBuilder) {
        self.collection = collection
        self.content = content
    }
    
    public typealias ContentBuilder = (CollectionType.Element) -> ViewType
    
    private let collection: CollectionType
    private let content: ContentBuilder
    
    public var body: some View {
        ForEach(Array(collection.enumerated()), id: \.offset) {
            content($0.element)
        }
    }
}
