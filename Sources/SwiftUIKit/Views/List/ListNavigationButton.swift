//
//  ListNavigationButton.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-03.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view wraps its content in a ``ListButton`` and appends
 a trailing ``ListDisclosureIndicator``, which makes it look
 like a navigation link.
 */
public struct ListNavigationButton<Content: View>: View {
    
    public init(
        action: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.action = action
        self.content = content
    }
    
    private let action: () -> Void
    private let content: () -> Content
    
    public var body: some View {
        ListButton(action: action) {
            HStack {
                content()
                Spacer()
                ListDisclosureIndicator()
            }
        }.buttonStyle(.plain)
    }
}

#if os(iOS)
struct ListNavigationButtonItem_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State var isToggled = false
        
        var body: some View {
            NavigationView {
                List {
                    ListItem {
                        Text("Is toggled: \(isToggled ? 1 : 0)")
                    }
                    ListItem {
                        NavigationLink("Navigation link", destination: Text("HEJ"))
                    }
                    ListNavigationButton(action: { isToggled.toggle() }, content: {
                        Text("Toggle")
                    })
                }
            }
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
#endif
