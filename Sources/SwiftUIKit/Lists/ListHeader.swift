//
//  ListHeader.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-06-01.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be added to the top of a `List` to show a top
 centered header above all other content.
 
 You can wrap any views in this view with the `.listHeader()`
 view modifier.
 */
public struct ListHeader<Icon: View>: View {

    /**
     Create a list header.
     
     - Parameters:
       - bottomPadding: A bottom padding meant to reduce the spacing to the list content, by default `20`.
       - view: The header view.
     */
    public init(
        bottomPadding: Double = -20,
        @ViewBuilder view: @escaping () -> Icon
    ) {
        self.bottomPadding = bottomPadding
        self.view = view
    }
    
    private let bottomPadding: Double

    private let view: (() -> Icon)

    public var body: some View {
        Section {
            EmptyView()
        } header: {
            ZStack(alignment: .center) {
                view()
            }
            .frame(maxWidth: .infinity)
        }
        .listRowBackground(Color.clear)
        .padding(.bottom, -20)
    }
}

public extension View {
    
    func listHeader() -> some View {
        ListHeader {
            self
        }
    }
}

#Preview {
    
    VStack {
        List {
            ListHeader {
                Color.red.frame(square: 150)
            }
            Section {
                Text("Item")
                Text("Item")
                Text("Item")
                Text("Item")
            }
        }
        List {
            ListHeader {
                Image(systemName: "checkmark")
                    .font(.largeTitle)
            }
            Section {
                Text("Item")
                Text("Item")
                Text("Item")
                Text("Item")
            }
        }
    }
    
}
