//
//  ListButton.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view wraps the provided content in a ``ListItem`` that
 is wrapped in a `Button` that triggers the provided action.
 */
public struct ListButton<Content: View>: View {
    
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
        Button(action: action) {
            ListItem(content: content)
        }
    }
}

struct ListButton_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State var isToggled = false
        
        var body: some View {
            List {
                ListItem {
                    Text("Is toggled: \(isToggled ? 1 : 0)")
                }
                ListButton(action: toggle) {
                    Text("Toggle")
                }
            }
        }
        
        func toggle() {
            isToggled.toggle()
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
