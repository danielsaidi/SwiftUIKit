//
//  NavigationLinkArrow.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-18.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view represents the trailing navigation arrow that are
 added to `NavigationLink` items in a `List`.
 */
public struct NavigationLinkArrow: View {

    public init() {}

    public var body: some View {
        Image(systemName: "chevron.right")
            .font(font)
            .opacity(opacity)
            .padding(.leading, padding)
            .scaleEffect(scale)
    }
}

private extension NavigationLinkArrow {
    
    var font: Font {
        #if os(iOS)
        Font.footnote.weight(.semibold)
        #elseif os(tvOS)
        Font.caption.weight(.bold)
        #else
        Font.footnote.weight(.semibold)
        #endif
    }
    
    var opacity: Double {
        0.3
    }
    
    var padding: Double {
        2
    }
    
    var scale: Double {
        #if os(iOS)
        1.05
        #elseif os(tvOS)
        0.95
        #else
        1.00
        #endif
    }
}

#Preview {
    
    NavigationView {
        List {
            NavigationLink {
                Text("Preview.Text", bundle: .module)
            } label: {
                Text("Preview.Link", bundle: .module)
            }

            NavigationLink("Preview.Link") {
                Color.red
            }
            NavigationButton {} content: {
                Text("Preview.Text", bundle: .module)
            }
            NavigationLinkArrow()
        }
    }
    .foregroundColor(.red)
}
