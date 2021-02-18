//
//  MenuListItem.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 A list item can have a left image, a centered title as well
 as an optional right image.
 */
public struct MenuListItem: View {
    
    public init(
        image: Image? = nil,
        text: String,
        rightImage: Image? = nil) {
        self.init(image, text, rightImage)
    }
    
    public init(
        _ image: Image? = nil,
        _ text: String,
        _ rightImage: Image? = nil) {
        self.init(image, text, rightImage, isNavigation: false)
    }
    
    public init(
        _ text: String,
        _ rightImage: Image? = nil) {
        self.init(nil, text, rightImage, isNavigation: false)
    }
    
    init(
        _ image: Image?,
        _ text: String,
        _ rightImage: Image?,
        isNavigation: Bool = false) {
        self.image = image
        self.text = text
        self.rightImage = rightImage
        self.isNavigation = isNavigation
    }
    
    private let text: String
    private let image: Image?
    private let rightImage: Image?
    private let isNavigation: Bool
    
    public var body: some View {
        HStack {
            if let image = image {
                image.frame(width: 20).padding(.trailing, 10)
            }
            Text(text)
            if let image = rightImage {
                Spacer()
                rightImageView(for: image)
            }
        }.background(Color.white.opacity(0.0001))
    }
}

private extension MenuListItem {
    
    @ViewBuilder
    func rightImageView(for image: Image) -> some View {
        if isNavigation {
            image
                .padding(.leading, 10)
                .font(SwiftUI.Font.footnote.bold())
                .opacity(0.2)
                .scaleEffect(1.05)
        } else {
            image
        }
    }
}

struct MenuListItem_Previews: PreviewProvider {
    
    static var icon: Image { Image(systemName: "checkmark.circle.fill") }
    
    static var previews: some View {
        List {
            MenuListItem("This is a list item")
            MenuListItem("This is a list item", icon)
            MenuListItem(icon, "This is a list item")
            MenuListItem(icon, "This is a list item", icon)
        }
    }
}
