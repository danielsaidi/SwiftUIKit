//
//  UrlSharing.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-31.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This protocol can be implemented by any view that can share
 a url, using a certain ``UrlSharing/sheet``.
 */
public protocol UrlSharing: View {
    
    var sheet: SheetContext { get }
}

public extension UrlSharing {
    
    /**
     Share the provided url using a ``ShareSheet``.
     */
    func share(_ url: URL) {
        sheet.present(ShareSheet(activityItems: [url]))
    }
}
#endif
