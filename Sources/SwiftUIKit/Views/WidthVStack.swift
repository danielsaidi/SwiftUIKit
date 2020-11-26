//
//  WidthVStack.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-11.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view lists views vertically and provides them with the
 widest width in the provided content builder.
 
 Note that you must run a live preview for this view to work
 in the previews.
 
 `TODO` For now, this triggers the following warning message
 when you run it in an app:
 
 ```
 Bound preference MaximumWidthPreferenceKey tried to update multiple times per frame.
 ```
 */
public struct WidthVStack<Content: View>: View {
    
    public init(
        spacing: CGFloat = 20,
        @ViewBuilder content: @escaping (Width) -> Content) {
        self.spacing = spacing
        self.content = content
    }
    
    public typealias Width = CGFloat
    
    let spacing: CGFloat
    let content: (Width) -> Content
    
    @State private var maximumSubViewWidth: CGFloat = 0
    
    public var body: some View {
        VStack(spacing: spacing) {
            content(maximumSubViewWidth)
                .overlay(DetermineWidth())
        }.onPreferenceChange(DetermineWidth.Key.self) {
            maximumSubViewWidth = $0
        }
    }
}

private struct MaximumWidthPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

private struct DetermineWidth: View {
    
    typealias Key = MaximumWidthPreferenceKey
    
    var body: some View {
        GeometryReader { proxy in
            Color.clear
                .anchorPreference(key: Key.self, value: .bounds) {
                    proxy[$0].size.width
                }
        }
    }
}

struct VerticalSizingList_Previews: PreviewProvider {
    
    static func button(for width: CGFloat) -> some View {
        Button(action: {}) {
            Text("\(Int.random(in: 0...100_000))")
                    .frame(width: width)
        }
    }
    
    static var previews: some View {
        WidthVStack { width in
            button(for: width)
            button(for: width)
            button(for: width)
        }
    }
}
