//
//  View+Prefers.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-08-01.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {

    /// Applies `.menuOrder(.fixed)`.
    ///
    /// This modifier is only applied in iOS 16.0 and later.
    @ViewBuilder
    func prefersMenuOrderFixed() -> some View {
        if #available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *) {
            self.menuOrder(.fixed)
        } else {
            self
        }
    }

    /// Applies `.persistentSystemOverlays(.hidden)`.
    ///
    /// This modifier is only applied in iOS 16.0 and later.
    @ViewBuilder
    func prefersPersistentSystemOverlaysHidden() -> some View {
        if #available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *) {
            self.persistentSystemOverlays(.hidden)
        } else {
            self
        }
    }
}

#Preview {

    VStack {
        #if os(iOS) || os(macOS)
        Menu("Preview.Menu") {
            Button("Preview.Button.\(1)") {}
            Button("Preview.Button.\(2)") {}
        }
        .prefersMenuOrderFixed()
        #endif
    }
    .prefersPersistentSystemOverlaysHidden()
}
