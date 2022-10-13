//
//  ListSelectItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view wraps the provided content within an `HStack` and
 adds a trailing image if the view is selected.
 */
public struct ListSelectItem<Content: View>: View {
    
    public init(
        isSelected: Bool,
        selectedImage: Image = Image(systemName: "checkmark"),
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.isSelected = isSelected
        self.selectedImage = selectedImage
        self.content = content
    }
    
    private let isSelected: Bool
    private let selectedImage: Image
    private let content: () -> Content
    
    public var body: some View {
        HStack {
            content()
            Spacer()
            if isSelected {
                selectedImage
            }
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
struct ListSelectItem_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State
        private var selection = 0
        
        var body: some View {
            List {
                ForEach(0...10, id: \.self) { index in
                    ListSelectItem(isSelected: index == selection) {
                        Label("Item \(index)", systemImage: "\(index).circle")
                    }
                }
            }
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
