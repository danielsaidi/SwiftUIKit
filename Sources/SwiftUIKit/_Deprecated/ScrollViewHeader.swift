//
//  ScrollViewHeader.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-10-13.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to the ScrollKit project - https://github.com/danielsaidi/ScrollKit")
public struct ScrollViewHeader<Content: View>: View {

    public init(
        parallaxMode: ParallaxMode = .none,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.parallaxMode = parallaxMode
        self.content = content
    }

    private let parallaxMode: ParallaxMode
    private let content: () -> Content

    public var body: some View {
        GeometryReader { geo in
            ZStack {
                if geo.frame(in: .global).minY <= 0 {
                    content()
                        .frame(
                            width: geo.size.width,
                            height: geo.size.height
                        )
                        .offset(y: -(geo.frame(in: .global).minY / parallaxMode.offsetDivisionFactor))
                } else {
                    content()
                        .frame(
                            width: geo.size.width,
                            height: geo.size.height + geo.frame(in: .global).minY
                        )
                        .offset(y: -geo.frame(in: .global).minY)
                }
            }
        }
    }

    /**
     This enum specifies the different parallax mode that can be
     used together with a ``ScrollViewHeader``.
     */
    public enum ParallaxMode {

        /// The parallax effect is disabled.
        case none

        /// The parallax effect is barely noticable.
        case discrete

        /// The parallax effect is very noticable.
        case prominent

        var offsetDivisionFactor: Double {
            switch self {
            case .none: return 500
            case .discrete: return 10
            case .prominent: return 2
            }
        }
    }
}
