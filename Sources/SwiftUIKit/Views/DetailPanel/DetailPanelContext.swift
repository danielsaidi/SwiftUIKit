//
//  DetailPanelContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-16.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import SwiftUI

/**
 This type is used to control ``DetailPanelPresenter`` state.
 */
public class DetailPanelContext: ObservableObject {
    
    /**
     Create a context instance.
     
     - Parameters:
       - isOpen: Whether or not the detail panel should be open from start.
     */
    public init(isOpen: Bool = true) {
        self.isOpen = isOpen
    }
    
    /**
     Whether or not the detail panel is open.
     */
    public var isOpen: Bool
}
#endif
