//
//  PageIndicator.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-30.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PageView")
public struct PageIndicator: View {
    
    /**
     Create a page indicator.
     
     - Parameters:
       - numberOfPages: The number of pages to display.
       - currentPageIndex: The currently selected page index.
     */
    public init(
        numberOfPages: Int,
        currentPageIndex: Binding<Int>
    ) {
        self.numberOfPages = numberOfPages
        self.currentPageIndex = currentPageIndex
    }
    
    private let currentPageIndex: Binding<Int>
    private let numberOfPages: Int
    
    @Environment(\.pageIndicatorStyle)
    private var style: PageIndicatorStyle
    
    public var body: some View {
        HStack(spacing: style.dotSpacing) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Button(action: { setCurrentPage(index)}, label: {
                    Circle()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(height: isCurrentPage(index) ? style.currentDotSize : style.dotSize)
                        .foregroundColor(isCurrentPage(index) ? style.currentDotColor : style.dotColor)
                }).buttonStyle(.plain)
            }
        }
    }

    private func isCurrentPage(_ index: Int) -> Bool {
        index == currentPageIndex.wrappedValue
    }
    
    private func setCurrentPage(_ index: Int) {
        if style.isAnimated {
            withAnimation { currentPageIndex.wrappedValue = index }
        } else {
            currentPageIndex.wrappedValue = index
        }
    }
}
