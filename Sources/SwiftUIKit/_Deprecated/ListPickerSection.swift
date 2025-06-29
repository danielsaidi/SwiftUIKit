//
//  ListPickerSection.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-23.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
public struct ListPickerSection<Item: Identifiable>: Identifiable {
    
    public init(title: String, items: [Item]) {
        self.id = UUID()
        self.title = title
        self.items = items
    }
    
    public let id: UUID
    public let title: String
    public let items: [Item]
    
    @ViewBuilder
    var header: some View {
        if title.trimmingCharacters(in: .whitespaces).isEmpty {
            EmptyView()
        } else {
            Text(title)
        }
    }
}
