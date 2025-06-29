//
//  NavigationLinkArrow.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-18.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
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

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
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
