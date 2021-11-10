//
//  ListButtonLinkItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-03.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This view wraps the provided content in a ``ListButtonItem``
 and then appends a ``ListDisclosureIndicator``, which makes
 the button look like a navigation link.
 */
public struct ListButtonLinkItem<Content: View>: View {
    
    public init(
        action: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content) {
        self.action = action
        self.content = content
    }
    
    private let action: () -> Void
    @ViewBuilder private let content: () -> Content
    
    public var body: some View {
        ListButtonItem(action: action) {
            HStack {
                content()
                Spacer()
                ListDisclosureIndicator()
            }
        }.buttonStyle(.plain)
    }
}

struct ListButtonLinkItem_Previews: PreviewProvider {
    
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
                    ListButtonLinkItem(action: { isToggled.toggle() }, content: {
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
