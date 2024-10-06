//
//  ShadowStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This styles defines shadow values, to allow strong typing.
 
 You can specify your own standard styles by creating static,
 calculated extension properties, for instance:
 
 ```swift
 extension ShadowStyle {
 
     static let badge = Self(
         color: Color.black.opacity(0.1),
         radius: 3,
         x: 0,
         y: 2
     )
 }
 ```
 
 You can apply the style with the `.font(_ style:)` modifier.
 ```
 */
public struct ViewShadowStyle {
    
    public init(
        color: Color? = nil,
        radius: CGFloat = 0,
        x: CGFloat = 0,
        y: CGFloat = 0
    ) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
    
    public let color: Color?
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat
}

public extension ViewShadowStyle {
    
    /// This style applies no shadow.
    static var none: Self {
        .init(color: .clear)
    }

    /// The shadow of a badge that is attached to its parent
    /// view, but in a slightly separated layer.
    static var badge: Self {
        .init(radius: 1, y: 1)
    }

    /// The shadow of a solid element that is elevated a bit
    /// above its parent view.
    static var elevated: Self {
        .init(radius: 3, x: 0, y: 2)
    }

    /// The shadow of a thin sticker that is attached to its
    /// parent view.
    static var sticker: Self {
        .init(radius: 0, y: 1)
    }
}

public extension View {

    /// Apply a ``ViewShadowStyle`` to the view.
    @ViewBuilder
    func shadow(_ style: ViewShadowStyle) -> some View {
        if let color = style.color {
            shadow(
                color: color,
                radius: style.radius,
                x: style.x,
                y: style.y
            )
        } else {
            shadow(
                radius: style.radius,
                x: style.x,
                y: style.y
            )
        }
    }
}

#Preview {

    struct Preview: View {

        @State
        private var isItemElevated = false

        var item: some View {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .frame(width: 100, height: 100)
        }

        var body: some View {
            VStack(spacing: 20) {
                item.shadow(.none)
                item.shadow(.badge)
                item.shadow(.sticker)

                #if os(iOS)
                item.onTapGesture(perform: toggleElevated)
                    .shadow(isItemElevated ? .elevated : .badge)
                #endif

                item.shadow(.elevated)
            }
            .padding()
            .background(Color.gray.opacity(0.4))
        }

        func toggleElevated() {
            withAnimation {
                isItemElevated.toggle()
            }
        }
    }
    
    return Preview()
}
