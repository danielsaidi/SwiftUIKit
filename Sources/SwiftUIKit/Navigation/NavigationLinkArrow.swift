//
//  NavigationLinkArrow.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-18.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
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
            .opacity(0.3)
            .padding(.leading, 2)
            .scaleEffect(scale)
    }
}

private extension NavigationLinkArrow {
    
    var font: Font {
        #if os(iOS)
        return Font.footnote.weight(.semibold)
        #elseif os(tvOS)
        return Font.caption.weight(.bold)
        #else
        return Font.footnote.weight(.semibold)
        #endif
    }
    
    var scale: CGFloat {
        #if os(iOS)
        return 1.05
        #elseif os(tvOS)
        return 0.95
        #else
        return 1.00
        #endif
    }
}


@available(watchOS 7.0, *)
struct Image_App_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            List {
                NavigationLink("Test") {
                    Color.red
                }
                NavigationButton {} content: {
                    Text("HEJ")
                }
                NavigationLinkArrow()
            }
        }.foregroundColor(.red)
    }
}
