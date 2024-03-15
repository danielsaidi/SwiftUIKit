//
//  AboutPanelCommand.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-11-21.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import SwiftUI

/**
 This command can be used to open the macOS About Panel.
 */
public struct AboutPanelCommand: Commands {
    
    /// Create an About Panel command with panel properties.
    ///
    /// - Parameters:
    ///   - title: The menu bar title.
    ///   - applicationName: The name of the app, buy default the main bundle display name.
    ///   - credits: Additional credits, by default `nil`.
    public init(
        title: String,
        applicationName: String = Bundle.main.displayName,
        credits: String? = nil
    ) {
        let options: [NSApplication.AboutPanelOptionKey: Any]
        if let credits {
            options = [
                .applicationName: applicationName,
                .credits: NSAttributedString(
                    string: credits,
                    attributes: [
                        .foregroundColor: NSColor.secondaryLabelColor,
                        .font: NSFont.systemFont(ofSize: NSFont.smallSystemFontSize)
                    ]
                )
            ]
        } else {
            options = [.applicationName: applicationName]
        }
        self.init(title: title, options: options)
    }
    
    /// Create an About Panel command with custom options.
    ///
    /// - Parameters:
    ///   - title: The menu bar title.
    ///   - options: Custom about panel options.
    public init(
        title: String,
        options: [NSApplication.AboutPanelOptionKey: Any]
    ) {
        self.title = title
        self.options = options
    }
    
    private let title: String
    private let options: [NSApplication.AboutPanelOptionKey: Any]
    
    public var body: some Commands {
        CommandGroup(replacing: .appInfo) {
            Button(title) {
                NSApplication.shared
                    .orderFrontStandardAboutPanel(options: options)
            }
        }
    }
}
#endif
