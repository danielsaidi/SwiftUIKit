//
//  SidebarPresenter.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-16.
//  Copyright © 2022-2023 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import SwiftUI

@available(*, deprecated, message: "Use a NavigationSplitView instead.")
public protocol SidebarPresenter {}

@available(*, deprecated, message: "Use a NavigationSplitView instead.")
public extension SidebarPresenter {
    
    var sidebarToggleButton: some View {
        Button(action: toggleSidebar) {
            Image(systemName: "sidebar.left")
        }
    }
    
    func toggleSidebar() {
        let selector = #selector(NSSplitViewController.toggleSidebar(_:))
        let responder = NSApp.keyWindow?.firstResponder
        responder?.tryToPerform(selector, with: nil)
    }
}
#endif
