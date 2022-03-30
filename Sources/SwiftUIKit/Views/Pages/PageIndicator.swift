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
 dots that indicate pages in a page view.
 
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
        style: Style = .standard) {
        self.numberOfPages = numberOfPages
        self.currentPageIndex = currentPageIndex
        self.style = style
    }
    
    /**
     This style can be used to style a `PageIndicator`.
     */
    public struct Style {
        
        /**
         Create a custom page indicator style.
         
         - Parameters:
           - dotColor: The indicator dot color, by default `.primary` with 0.5 opacity.
           - dotSize: The indicator dot size, by default `10`.
           - currentDotColor: The indicator current dot color, by default `.primary`.
           - currentDotSize: The indicator current dot size, by default `10`.
           - dotSpacing: The spacing to apply between dots, by default `nil`.
           - isAnimated: Whether or not changing pages is animated, by default `true`.
         */
        public init(
            dotColor: Color = .primary.opacity(0.5),
            dotSize: CGFloat = 10,
            dotSpacing: CGFloat? = nil,
            currentDotColor: Color = .primary,
            currentDotSize: CGFloat = 10,
            isAnimated: Bool = true) {
            self.dotColor = dotColor
            self.dotSize = dotSize
            self.dotSpacing = dotSpacing
            self.currentDotColor = currentDotColor
            self.currentDotSize = currentDotSize
            self.isAnimated = isAnimated
        }
        
        /**
         The indicator current dot color.
         */
        public var currentDotColor: Color
        
        /**
         The indicator current dot size.
         */
        public var currentDotSize: CGFloat
        
        /**
         The indicator dot color.
         */
        public var dotColor: Color
        
        /**
         The indicator dot size.
         */
        public var dotSize: CGFloat
        
        /**
         The spacing to apply between dots.
         */
        public var dotSpacing: CGFloat?
        
        /**
         Whether or not changing pages is animated.
         */
        public var isAnimated: Bool
        
        /**
         The standard style.
         */
        public static var standard: Style { Style() }
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
    private let style: Style
    
    
    public var body: some View {
        HStack(spacing: style.dotSpacing) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Button(action: { setCurrentPage(index)}) {
                    Circle()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(height: isCurrentPage(index) ? style.currentDotSize : style.dotSize)
                        .foregroundColor(isCurrentPage(index) ? style.currentDotColor : style.dotColor)
                }.buttonStyle(.plain)
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
        VStack {
            PageIndicator(
                numberOfPages: 10,
                currentPageIndex: .constant(3))
            
            PageIndicator(
                numberOfPages: 5,
                currentPageIndex: .constant(3),
                style: PageIndicator.Style(
                    dotColor: .blue,
                    dotSpacing: 20,
                    currentDotColor: .yellow))
            
        }
    }
}
