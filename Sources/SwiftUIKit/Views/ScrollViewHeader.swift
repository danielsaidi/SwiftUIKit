//
//  ScrollViewHeader.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-10-13.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used as a topmost scroll view header, that
 stretches if the scroll view is pulled down.

 This makes it possible to have a background image that will
 resize to fit any additional space that the header receives
 when it's pulled down.

 For instance, to add a header with a background image, some
 dark overlay over the image and bottom-aligned content, you
 can do this:

 ```swift
 ScrollView(.vertical) {
    VStack(spacing: 0) {
        ScrollViewHeader {
            ZStack(alignment: .bottomLeading) {
                backgroundImage
                Color.black.opacity(0.3)
                Text("Header title")
            }
        }
    }
 }
 ```

 `IMPORTANT` You must apply a height to this view, otherwise
 it will collapse to zero height.
 */
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
}

public extension ScrollViewHeader {

    /**
     This enum specifies the different parallax mode that can be
     used together with a ``ScrollViewHeader``.
     */
    enum ParallaxMode {

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

struct ScrollViewHeader_Previews: PreviewProvider {

    static var previews: some View {
        ScrollView {
            ScrollViewHeader(parallaxMode: .prominent) {
                ZStack(alignment: .bottomLeading) {
                    LinearGradient(
                        colors: [.red, .blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                    LinearGradient(
                        colors: [.clear, .black.opacity(0.6)],
                        startPoint: .top,
                        endPoint: .bottom)
                    VStack(alignment: .leading) {
                        Text("Title").font(.title)
                        Text("Subtitle").font(.headline)
                    }
                    .shadow(.elevated)
                    .padding()
                }.colorScheme(.dark)
            }.frame(height: 300)

            ForEach(1...100, id: \.self) {
                Text("\($0)").frame(maxWidth: .infinity)
            }.background(Color.primary.colorInvert())
        }
    }
}
