//
//  PageIndicator.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-30.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used to display a horizontal collection of
 dots that are bound to pages in a page view.
 
 You can use this view to customize the style of the dots in
 a `TabView` (or ``PageView``).
 */
public struct PageIndicator: View {
    
    /**
     Create a page indicator.
     
     - Parameters:
       - numberOfPages: The number of pages to display.
       - currentPageIndex: The currently selected page index.
       - style: The style to apply to the indicator.
     */
    public init(
        numberOfPages: Int,
        currentPageIndex: Binding<Int>,
        style: PageIndicatorStyle = .standard
    ) {
        self.numberOfPages = numberOfPages
        self.currentPageIndex = currentPageIndex
        self.style = style
    }
    
    /**
     The currently selected page index.
     */
    private let currentPageIndex: Binding<Int>
    
    /**
     The number of pages to display.
     */
    private let numberOfPages: Int
    
    /**
     The style to apply to the indicator.
     */
    private let style: PageIndicatorStyle
    
    
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
}

private extension PageIndicator {
    
    func isCurrentPage(_ index: Int) -> Bool {
        index == currentPageIndex.wrappedValue
    }
    
    func setCurrentPage(_ index: Int) {
        if style.isAnimated {
            withAnimation { currentPageIndex.wrappedValue = index }
        } else {
            currentPageIndex.wrappedValue = index
        }
    }
}

struct PageIndicator_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack(spacing: 20) {
            PageIndicator(
                numberOfPages: 10,
                currentPageIndex: .constant(3))
            
            PageIndicator(
                numberOfPages: 5,
                currentPageIndex: .constant(3),
                style: PageIndicatorStyle(
                    dotColor: .blue,
                    dotSpacing: 20,
                    currentDotColor: .yellow))
            
        }
        .padding()
        .background(Color.gray)
        .cornerRadius(20)
    }
}
