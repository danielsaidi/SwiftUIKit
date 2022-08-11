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
 This container view simulates a macOS screen with a leading
 main content and a trailing detail info panel.
 
 The view can be used together with a ``DetailPanelPresenter``
 to build a macOS window that has a leading main content and
 a trailing detail info panel, that can be opened and closed.
 It takes care of wrapping the content and panel view within
 an `HSplitView` and applying the correct frame to the views.
 
 The `panel` view is a custom view, which means that you can
 use any view as detail panel. The ``DetailPanel`` view is a
 good view to use to simulate a macOS detail panel.
 
 Note that the view only simulates the native macOS behavior
 since it's currently hard to implement with SwiftUI. We can
 hopefully deprecate this soon, provided that Apple provides
 us with improved apis.
 */
public struct DetailPanelContainer<Content: View, Panel: View>: View {
    
    /**
     Create a detail panel with a custom background view.
     
     - Parameters:
       - isDetailPanelOpen: Whether or not the panel is open.
       - contentMinWidth: The minimum width of the main content.
       - panelMinWidth: The minimum width of the detail panel.
       - content: The main content view.
       - panel: The panel content view.
     */
    public init(
        isDetailPanelOpen: Bool,
        contentMinWidth: CGFloat = 500,
        panelMinWidth: CGFloat = 200,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder panel: @escaping () -> Panel
    ) {
        self.isDetailPanelOpen = isDetailPanelOpen
        self.contentMinWidth = contentMinWidth
        self.panelMinWidth = panelMinWidth
        self.content = content
        self.panel = panel
    }
    
    private let isDetailPanelOpen: Bool
    private let content: () -> Content
    private let contentMinWidth: CGFloat
    private let panel: () -> Panel
    private let panelMinWidth: CGFloat
    
    public var body: some View {
        HSplitView {
            content()
                .frame(minWidth: contentMinWidth)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .layoutPriority(1)
            
            panel()
                .frame(minWidth: isDetailPanelOpen ? panelMinWidth : 0)
                .frame(maxWidth: isDetailPanelOpen ? .infinity : 0)
                .animation(.none, value: isDetailPanelOpen)
        }
    }
}
#endif
