//
//  VerticalResizingList.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-11.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can list a collection of views in a vertical list
 and resize them to the widest view.
 */
public struct VerticalResizingList<Content: View>: View {
    
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
            HStack {
                Spacer()
                Text("\(Int.random(in: 0...1000))")
                Spacer()
            }
        }
    }
    
    static var previews: some View {
        VerticalResizingList { width in
            button(for: width)
            button(for: width)
            button(for: width)
        }
    }
}
