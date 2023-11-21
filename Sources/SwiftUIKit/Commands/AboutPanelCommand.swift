//
//  AboutPanelCommand.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-11-21.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import SwiftUI

/**
 This command can be used to customize the app's about panel.
 */
public struct AboutPanelCommand: Commands {
    
    /**
     Create an about panel command.
     
     - Parameters:
       - title: The menu bar title.
       - options: The options to customize.
     */
    public init(
        title: String,
        options: [NSApplication.AboutPanelOptionKey: Any]
    ) {
        self.title = title
        self.options = options
    }
    
    /// The menu bar title.
    public let title: String
    
    /// The options to customize.
    public let options: [NSApplication.AboutPanelOptionKey: Any]
    
    public var body: some Commands {
        CommandGroup(replacing: .appInfo) {
            Button(title) {
                NSApplication.shared.orderFrontStandardAboutPanel(options: options)
            }
        }
    }
}

#endif
