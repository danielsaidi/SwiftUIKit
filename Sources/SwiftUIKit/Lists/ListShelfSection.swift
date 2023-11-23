//
//  ListShelfSection.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2023-04-26.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used to add a horizontally scrolling shelf
 to a vertically scrolling list.
 */
public struct ListShelfSection<Title: View, Content: View>: View {

    /**
     Create a list shelf section.

     - Parameters:
       - style: The style to use, by default `.standard`.
       - title: The section title view.
       - content: The section content.
     */
    public init(
        style: ListShelfSectionStyle = .standard,
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.style = style
        self.title = title
        self.content = content
    }
    
    private let style: ListShelfSectionStyle
    private let shadowSpacing = 50.0

    @ViewBuilder
    private let title: () -> Title

    @ViewBuilder
    private let content: () -> Content

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            title()
                .padding(.horizontal, style.horizontalPadding)
                .padding(.bottom, style.rowTitleSpacing)
                
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: style.rowItemSpacing) {
                    content()
                }
                .padding(.vertical, shadowSpacing)
                .padding(.horizontal, style.horizontalPadding)
            }
            .padding(.vertical, -shadowSpacing)
            .padding(.bottom, style.rowSpacing)
        }
    }
}

public struct ListShelfSectionStyle {
    
    /**
     Create a new section style.
     
     - Parameters:
       - horizontalPadding: The horizontal edge padding to apply, by default `16`.
       - rowSpacing: The spacing to apply between each row, by default `16`.
       - rowTitleSpacing: The bottom padding to apply to each row title, by default `0`.
       - rowItemSpacing: The spacing to apply between each row item, by default `16`.
     */
    public init(
        horizontalPadding: Double = 16,
        rowSpacing: Double = 16,
        rowTitleSpacing: Double = 10,
        rowItemSpacing: Double = 16
    ) {
        self.horizontalPadding = horizontalPadding
        self.rowSpacing = rowSpacing
        self.rowTitleSpacing = rowTitleSpacing
        self.rowItemSpacing = rowItemSpacing
    }
    
    /// The horizontal edge padding to apply.
    public var horizontalPadding: Double
    
    /// The spacing to apply between each row.
    public var rowSpacing: Double
    
    /// The bottom padding to apply to each row title.
    public var rowTitleSpacing: Double
    
    /// The spacing to apply between each row item.
    public var rowItemSpacing: Double
    
    /**
     The standard ``ListShelfSectionStyle``.
     
     You can change this style to affect the global default.
     */
    public static var standard = ListShelfSectionStyle()
}

#Preview {
    
    struct PreviewSection: View {
        
        var body: some View {
            ListShelfSection {
                ListSectionTitle("Section")
            } content: {
                Group {
                    ListCard {
                        Color.red
                    } contextMenu: {
                        Button("1") {}
                        Button("2") {}
                        Button("3") {}
                    }
                    ListCard {
                        Color.green
                    } contextMenu: {
                        Button("1") {}
                        Button("2") {}
                        Button("3") {}
                    }
                    ListCard {
                        Color.blue
                    } contextMenu: {
                        Button("1") {}
                        Button("2") {}
                        Button("3") {}
                    }
                }
                .frame(width: 150, height: 150)
            }
        }
    }
        
    return ScrollView(.vertical) {
        VStack {
            PreviewSection()
            PreviewSection()
            PreviewSection()
        }
    }
}
