//
//  DetailPanelPresenter.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-16.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import SwiftUI

/**
 This protocol can be implemented by any views or types that
 should be able to present a macOS trailing detail panel. It
 adds more features, that make it easier to handle the panel.
 
 When using this presenter, you should use a ``DetailPanel``
 to specify a detail panel or a ``MasterDetailContainer`` to
 setup the entire framework of a master detail view setup.
 
 These views will setup the detail panel to behave correctly
 by simulating the native macOS detail panel setup, using an
 HSplitView. We can hopefully ditch this approach later when
 SwiftUI is more mature.
 */
public protocol DetailPanelPresenter {
    
    /**
     Whether or not the info panel is open.
     */
    var detailPanelContext: DetailPanelContext { get }
}

public extension DetailPanelPresenter {
    
    /**
     Whether or not the detail panel is open.
     */
    var isDetailPanelOpen: Bool {
        detailPanelContext.isOpen
    }
    
    /**
     Close the detail panel.
     */
    func closeDetailPanel() {
        detailPanelContext.isOpen = false
    }
    
    /**
     Open the detail panel.
     */
    func openDetailPanel() {
        detailPanelContext.isOpen = true
    }
    
    /**
     Toggle the detail panel.
     */
    func toggleDetailPanel() {
        detailPanelContext.isOpen.toggle()
    }
}
#endif
