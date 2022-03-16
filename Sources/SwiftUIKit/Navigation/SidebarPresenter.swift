//
//  SidebarPresenter.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-16.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import SwiftUI

/**
 This protocol can be implemented by any views or types that
 presents a macOS sidebar.
 
 The protocol adds more features to the type, which makes it
 easier to control the sidebar.
 */
public protocol SidebarPresenter {}

public extension SidebarPresenter {
    
    /**
     A button that can be used to toggle the navigation view
     sidebar, if any.
     */
    var sidebarToggleButton: some View {
        Button(action: toggleSidebar) {
            Image(systemName: "sidebar.left")
        }
    }
    
    /**
     Toggle the navigation view sidebar, if any.
     */
    func toggleSidebar() {
        let selector = #selector(NSSplitViewController.toggleSidebar(_:))
        let responder = NSApp.keyWindow?.firstResponder
        responder?.tryToPerform(selector, with: nil)
    }
}
#endif
