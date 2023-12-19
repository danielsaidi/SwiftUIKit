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
       - bottomPadding: The bottom padding, by default a platform-specific value.
       - view: The header view.
     */
    public init(
        bottomPadding: Double? = nil,
        @ViewBuilder view: @escaping () -> Icon
    ) {
        #if os(iOS)
        let defaultPadding: Double = -20
        #else
        let defaultPadding: Double = 0
        #endif
        self.bottomPadding = bottomPadding ?? defaultPadding
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
        .padding(.bottom, bottomPadding)
    }
}

public extension View {
    
    /**
     Convert the view to a list header.
     
     - Parameters:
       - bottomPadding: The bottom padding, by default a platform-specific value.
     */
    func listHeader(
        bottomPadding: Double? = nil
    ) -> some View {
        ListHeader(bottomPadding: bottomPadding) {
            self
        }
    }
}

public extension Image {
    
    /**
     Convert the image to a list header.
     
     - Parameters:
       - height: The image height, if any.
       - bottomPadding: The bottom padding, by default a platform-specific value.
     */
    func listHeader(
        height: CGFloat?,
        bottomPadding: Double? = nil
    ) -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: height)
            .listHeader()
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
            Image(systemName: "checkmark").listHeader(height: 75)
            Section {
                Text("Item")
                Text("Item")
                Text("Item")
                Text("Item")
            }
        }
    }
    
}
