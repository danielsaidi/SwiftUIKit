//
//  ListBadgeIcon.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-05-29.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This view mimics the color badge icons that can be found in
 e.g. System Settings.

 You can use the `.listBadgeIcon()` view modifier to convert
 any `Image` to a list badge icon.
 */
@available(iOS 15.0, *)
public struct ListBadgeIcon: View {

    /**
     Create a system settings mimicing list icon.
     */
    public init(
        image: Image,
        color: Color,
        height: CGFloat? = 30
    ) {
        self.image = image
        self.color = color
        self.height = height
    }

    private let image: Image
    private let color: Color
    private let height: CGFloat?

    public var body: some View {
        ZStack {
            prefersGradient(color)
                .aspectRatio(1, contentMode: .fit)
                .cornerRadius(7)
            image.symbolVariant(.fill)
                .padding(5)
                .aspectRatio(1, contentMode: .fit)
                .foregroundColor(color == .clear ? nil : .white)
        }.frame(minHeight: height, maxHeight: height)
    }
}

@available(iOS 15.0, *)
public extension Image {

    /**
     Convert the image to a system settings color badge icon.

     Note that this behaves best with SF Symbols.
     */
    func listBadgeIcon(
        _ color: Color,
        height: CGFloat? = 30
    ) -> some View {
        ListBadgeIcon(
            image: self,
            color: color,
            height: height
        )
    }
}

private extension View {

    @ViewBuilder
    func prefersGradient(_ color: Color) -> some View {
        if #available(iOS 16.0, *) {
            Color.clear.overlay(color.gradient)
        } else {
            color
        }
    }
}

@available(iOS 15.0, *)
struct ListBadgeIcon_Previews: PreviewProvider {

    static var previews: some View {
        List {
            ListBadgeIcon(
                image: .symbol("exclamationmark.triangle"),
                color: .orange
            )

            Image.symbol("checkmark")
                .listBadgeIcon(.green)

            Image.symbol("checkmark")
                .listBadgeIcon(.green)
                .font(.body.bold())
        }
    }
}
#endif
