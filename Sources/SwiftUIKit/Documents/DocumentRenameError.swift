//
//  DocumentRenameError.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-12-08.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This error can be thrown when renaming documents.
 */
public enum DocumentRenameError: Error {
    
    /// There is no available document url.
    case noDocumentUrl
}
