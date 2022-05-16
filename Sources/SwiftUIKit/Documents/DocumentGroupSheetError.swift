//
//  DocumentGroupSheetError.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-17.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import Foundation

/**
 This enum defines errors that can be thrown when presenting
 a ``DocumentGroupSheet``.
 */
public enum DocumentGroupSheetError: Error {
    
    /// There was no parent window to present the sheet from.
    case noParentWindow
}
#endif
