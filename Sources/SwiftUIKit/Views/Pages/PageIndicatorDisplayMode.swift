//
//  PageIndexDisplayMode.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-30.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This enum mimics `PageTabViewStyle.IndexDisplayMode`.
 */
public enum PageIndicatorDisplayMode {
    
    /// Always display a page indicator regardless of page count.
    case always
    
    /// Display a page indicator when there are more than one page.
    case automatic
    
    /// Never display a page indicator.
    case never
}

#if os(iOS) || os(tvOS) || os(watchOS)
extension PageIndicatorDisplayMode {
    
    @available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    var tabViewMode: PageTabViewStyle.IndexDisplayMode {
        #if os(iOS) || os(tvOS)
        switch self {
        case .always: return .always
        case .automatic: return .automatic
        case .never: return .never
        }
        #else
        return .automatic
        #endif
    }
}
#endif
