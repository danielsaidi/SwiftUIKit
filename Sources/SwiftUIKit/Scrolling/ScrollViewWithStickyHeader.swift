//
//  ScrollViewWithStickyHeader.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-02-03.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This scroll view lets you provide a custom header view that
 sticks to the top as the scroll view scrolls.

 The view wraps a ``ScrollViewWithOffset`` view and uses the
 provided scroll offset information to determine how much of
 the header that should be visible.

 Note that the view will enforce an `inline` navigation view
 title display mode, since the large header isn't applicable.
 You can however use the `scollOffset` with a custom toolbar
 title view to fade in the title as the view scrolls. Please
 have a look at the preview for an example.
 */
public struct ScrollViewWithStickyHeader<Header: View, Content: View>: View {

    /**
     Create a scroll view with a sticky header.

     - Parameters:
       - axes: The scroll axes to use.
       - scrollOffset: A scroll offset binding.
       - showsIndicators: Whether or not to show scroll indicators.
       - header: The sticky header view builder.
       - headerHeight: The height to apply to the header view.
       - content: The scroll view content builder.
     */
    public init(
        _ axes: Axis.Set = .vertical,
        scrollOffset: Binding<CGPoint>,
        showsIndicators: Bool = true,
        @ViewBuilder header: @escaping () -> Header,
        headerHeight: CGFloat,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.axes = axes
        self.scrollOffset = scrollOffset
        self.showsIndicators = showsIndicators
        self.header = header
        self.headerHeight = headerHeight
        self.content = content
    }

    let axes: Axis.Set
    let scrollOffset: Binding<CGPoint>
    let showsIndicators: Bool
    let header: () -> Header
    let headerHeight: CGFloat
    let content: () -> Content

    @State
    private var navigationBarHeight: CGFloat = 0

    private var headerVisibleRatio: CGFloat {
        (headerHeight + scrollOffset.wrappedValue.y) / headerHeight
    }

    public var body: some View {
        ZStack(alignment: .top) {
            scrollView
            navbarOverlay
                .ignoresSafeArea(edges: .top)
        }
        .prefersTransparentNavigationBar()
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension ScrollViewWithStickyHeader {

    var headerView: some View {
        header().frame(height: headerHeight)
    }

    @ViewBuilder
    var navbarOverlay: some View {
        if (headerVisibleRatio <= 0) {
            Color.clear
                .frame(height: navigationBarHeight)
                .overlay(scrollHeader, alignment: .bottom)
        } else {
            Color.clear
        }
    }

    var scrollView: some View {
        GeometryReader { proxy in
            ScrollViewWithOffset(scrollOffset: scrollOffset) {
                VStack(spacing: 0) {
                    scrollHeader
                    content()
                }
            }
            .onAppear {
                DispatchQueue.main.async {
                    navigationBarHeight = proxy.safeAreaInsets.top
                }
            }
        }
    }

    var scrollHeader: some View {
        ScrollViewHeader(parallaxMode: .none) {
            header()
        }.frame(height: headerHeight)
    }
}

struct ScrollViewWithStickyHeader_Previews: PreviewProvider {

    struct Preview: View {

        @State
        private var scrollOffset: CGPoint = .zero

        let headerHeight: CGFloat = 300

        var headerVisibleRatio: CGFloat {
            (headerHeight + scrollOffset.y) / headerHeight
        }

        var body: some View {
            NavigationView {
                ScrollViewWithStickyHeader(
                    scrollOffset: $scrollOffset,
                    header: { LinearGradient(colors: [.blue, .yellow], startPoint: .top, endPoint: .bottom) },
                    headerHeight: 250
                ) {
                    VStack {
                        ForEach(1...100, id: \.self) {
                            Text("\($0)").frame(maxWidth: .infinity)
                            Divider()
                        }
                    }.padding()
                }
                .navigationTitle("\(scrollOffset.y) | \(headerVisibleRatio)")
            }
        }
    }

    static var previews: some View {
        Preview()
    }
}

private extension View {

    @ViewBuilder
    func prefersTransparentNavigationBar() -> some View {
        if #available(iOS 16.0, *) {
            self.toolbarBackground(.hidden, for: .navigationBar)
        } else {
            self
        }
    }
}
