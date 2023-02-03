//
//  ScrollViewWithOffset.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-02-03.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This scroll view wraps a native `ScrollView` and tracks its
 scroll offset as it scrolls.
 */
public struct ScrollViewWithOffset<Content: View>: View {

    /**
     Create a scroll view with offset tracking.

     - Parameters:
       - axes: The scroll axes to use.
       - scrollOffset: A scroll offset binding.
       - showsIndicators: Whether or not to show scroll indicators.
       - content: The scroll view content.
     */
    public init(
        _ axes: Axis.Set = .vertical,
        scrollOffset: Binding<CGPoint>,
        showsIndicators: Bool = true,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.axes = axes
        self.scrollOffset = scrollOffset
        self.showsIndicators = showsIndicators
        self.content = content
    }

    let axes: Axis.Set
    let scrollOffset: Binding<CGPoint>
    let showsIndicators: Bool
    let content: () -> Content

    public var body: some View {
        ScrollView(axes, showsIndicators: showsIndicators) {
            ZStack(alignment: .top) {
                GeometryReader { geo in
                    Color.clear
                        .preference(
                            key: ScrollOffsetPreferenceKey.self,
                            value: geo.frame(in: .named(ScrollOffsetNamespace.namespace)).origin
                        )
                }
                .frame(height: 0)

                content()
            }
        }
        .coordinateSpace(name: ScrollOffsetNamespace.namespace)
        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { scrollOffset.wrappedValue = $0 }
    }
}

private enum ScrollOffsetNamespace {

    static let namespace = "scrollView"
}

private struct ScrollOffsetPreferenceKey: PreferenceKey {

    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}

@available(iOS 14.0, *)
struct ScrollViewWithOffset_Previews: PreviewProvider {

    struct Preview: View {

        @State
        private var scrollOffset: CGPoint = .zero

        var body: some View {
            NavigationView {
                ScrollViewWithOffset(scrollOffset: $scrollOffset) {
                    LazyVStack {
                        ForEach(1...100, id: \.self) {
                            Divider()
                            Text("\($0)").frame(maxWidth: .infinity)
                        }
                    }
                }.navigationTitle("Offset: \(scrollOffset.y)")
            }
        }
    }

    static var previews: some View {
        Preview()
    }
}
