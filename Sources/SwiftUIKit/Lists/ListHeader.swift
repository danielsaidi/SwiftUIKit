//
//  ListHeader.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-06-01.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be added to the top of a `List` to show a top
 centered header above all other content.
 
 You can wrap any views in this view with the `.listHeader()`
 view modifier.
 */
public struct ListHeader<Icon: View>: View {

    /// Create a list header.
    ///
    /// - Parameters:
    ///   - bottomPadding: A custom bottom padding, if any.
    ///   - view: The header view.
    public init(
        bottomPadding: Double? = nil,
        @ViewBuilder view: @escaping () -> Icon
    ) {
        #if os(iOS)
        let defaultPadding: Double = -10
        #else
        let defaultPadding: Double = 0
        #endif
        self.bottomPadding = bottomPadding ?? defaultPadding
        self.view = view
    }
    
    private let bottomPadding: Double

    private let view: (() -> Icon)

    public var body: some View {
        ZStack(alignment: .center) {
            view()
        }
        .frame(maxWidth: .infinity)
        .listRowBackground(Color.clear)
        .padding(.bottom, bottomPadding)
    }
}

public extension View {
    
    /// Convert the view to a list header.
    ///
    /// - Parameters:
    ///   - bottomPadding: A custom bottom padding, if any.
    func listHeader(
        bottomPadding: Double? = nil
    ) -> some View {
        ListHeader(bottomPadding: bottomPadding) {
            self
        }
    }
}

@MainActor
public extension Image {
    
    /// Convert the image to a list header.
    ///
    /// - Parameters:
    ///   - height: The image height, if any.
    ///   - bottomPadding: A custom bottom padding, if any.
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
    
    func item() -> some View {
        Text("Preview.Item", bundle: .module)
    }
    
    return VStack {
        List {
            ListHeader {
                Color.red.frame(square: 150)
            }
            Section {
                item()
                item()
                item()
                item()
            }
        }
        List {
            Image(systemName: "face.smiling").listHeader(height: 75)
            Section {
                item()
                item()
                item()
                item()
            }
        }
    }
    
}
