//
//  View+macOS.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-12-19.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import SwiftUI

extension View {
    
    /// Open the macOS Settings Panel.
    func openAppSettings() {
        NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
    }
}
#endif
