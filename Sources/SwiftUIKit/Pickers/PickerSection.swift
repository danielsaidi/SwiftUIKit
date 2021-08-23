//
//  Picker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-23.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This type can be used to create pickers with item sections.
 */
public struct PickerSection<Item: Identifiable>: Identifiable {
    
    public init(title: String, items: [Item]) {
        self.id = UUID()
        self.title = title
        self.items = items
    }
    
    public let id: UUID
    public let title: String
    public let items: [Item]
    
    @ViewBuilder
    var pickerHeader: some View {
        if title.trimmingCharacters(in: .whitespaces).isEmpty {
            EmptyView()
        } else {
            Text(title)
        }
    }
}
