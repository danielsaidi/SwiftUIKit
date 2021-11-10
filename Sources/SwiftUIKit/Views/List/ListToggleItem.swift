//
//  ListToggleItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used to append a trailing toggle after the
 list item, that toggles the provided binding.
 */
public struct ListToggleItem<Content: View>: View {
    
    public init(
        isOn: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content) {
        self.isOn = isOn
        self.content = content
    }
    
    private let isOn: Binding<Bool>
    @ViewBuilder private let content: () -> Content
    
    public var body: some View {
        ListItem {
            HStack {
                content()
                Spacer()
                Toggle("", isOn: isOn)
            }
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
struct ListToggleItem_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State private var isOn1 = false
        @State private var isOn2 = true
        
        var body: some View {
            List {
                ListToggleItem(isOn: $isOn1) {
                    Text("Toggle 1")
                }
                ListToggleItem(isOn: $isOn2) {
                    Label("Toggle 2", systemImage: "plus")
                }
            }
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
