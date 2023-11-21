//
//  AppHeaderIcon.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-06-01.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This header view can be added to the top of a `List` to e.g.
 show the app icon above all other content.
 */
public struct ListHeaderIcon<Icon: View>: View {

    public init(
        icon: Icon
    ) {
        self.icon = icon
        self.image = nil
        self.imageSize = 0
    }

    /**
     Create a list header icon.

     - Parameters:
       - image: The image to add.
       - size: The size of the image, by default `120`.
     */
    public init(
        image: Image,
        size: Double = 120
    ) where Icon == Image {
        self.icon = image
        self.image = image
        self.imageSize = size
    }

    private let icon: Icon
    private let image: Image?
    private let imageSize: CGFloat

    public var body: some View {
        Section {
            EmptyView()
        } header: {
            ZStack(alignment: .center) {
                iconView
            }
            .frame(maxWidth: .infinity)
        }
        .listRowBackground(Color.clear)
    }
}

private extension ListHeaderIcon {

    @ViewBuilder
    var iconView: some View {
        if let image {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageSize)
                .padding(.bottom, -10)
        } else {
            icon
        }
    }
}
