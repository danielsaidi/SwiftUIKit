//
//  UrlSharing.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-31.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

@available(*, deprecated, message: "Use ShareSheet directly instead.")
public protocol UrlSharing: View {
    
    var sheet: SheetContext { get }
}

@available(*, deprecated, message: "Use ShareSheet directly instead.")
public extension UrlSharing {
    
    /// Share the provided url using a ``ShareSheet``.
    func share(_ url: URL) {
        sheet.present(ShareSheet(activityItems: [url]))
    }
}
#endif
