//
//  DetailPanel.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-16.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import SwiftUI

/**
 This panel view simulates a macOS side panel.
 
 The view can be used together with a ``DetailPanelPresenter``
 to build a macOS window that has leading master content and
 a trailing detail info panel, that can be opened and closed.
 It takes care of applying the panel background and applying
 an animation that is used when the panel is opened.
 
 To simplify things even further, the ``DetailPanelContainer``
 can be used to specify both the main content as well as the
 panel content, and the minimum size of both content.
 
 Note that the view only simulates the native macOS behavior
 since it's currently hard to implement with SwiftUI. We can
 hopefully deprecate this soon, provided that Apple provides
 us with improved apis.
 */
public struct DetailPanel<Background: View, Content: View>: View {
    
    /**
     Create a detail panel with a custom background view.
     
     - Parameters:
       - isOpen: Whether or not the panel is open.
       - background: The background to use for the panel.
       - content: The content to add to the panel.
     */
    public init(
        isOpen: Bool,
        background: Background,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.isOpen = isOpen
        self.background = background
        self.content = content
    }
    
    private let isOpen: Bool
    private let background: Background
    private let content: () -> Content
    
    public var body: some View {
        ZStack {
            background
                .animation(.none, value: isOpen)
            
            content()
                .offset(x: isOpen ? 0 : 50)
                .animation(.linear(duration: 0.1), value: isOpen)
        }
        .frame(maxHeight: .infinity)
        .animation(.none, value: isOpen)
    }
}

public extension DetailPanel where Background == Color {
    
    /**
     Create a detail panel with a clear background.
     
     - Parameters:
       - isOpen: Whether or not the panel is open.
       - content: The content to add to the panel.
     */
    init(
        isOpen: Bool,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.init(
            isOpen: isOpen,
            background: Color.clear,
            content: content)
    }
}

@available(macOS 12.0, *)
public extension DetailPanel where Background == AnyView {
    
    /**
     Create a detail panel with a custom material background.
     
     - Parameters:
       - isOpen: Whether or not the panel is open.
       - backgroundMaterial: The background material to use for the panel.
       - content: The content to add to the panel.
     */
    init(
        isOpen: Bool,
        backgroundMaterial material: Material,
        @ViewBuilder content: @escaping () -> Content
    ) {
        let bg = Color.clear.background(material)
        self.init(
            isOpen: isOpen,
            background: AnyView(bg),
            content: content)
    }
}
#endif
