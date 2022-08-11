//
//  DocumentPresenter.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-12-08.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUI

/**
 This protocol can be implemented by any types that are used
 to present a document, extending them with additional logic.
 */
public protocol DocumentPresenter {
    
    /**
     The url of the currently opened document, if any.
     */
    var documentUrl: URL? { get }
}

public extension DocumentPresenter {
    
    /**
     Get the document name from the ``documentUrl``, if any.
     */
    func documentName(
        withExtension: Bool = false
    ) -> String? {
        if withExtension {
            return documentUrl?.lastPathComponent
        } else {
            return documentUrl?.deletingPathExtension().lastPathComponent
        }
    }
    
    /**
     Whether or not the presented can rename the document.
     
     For document renaming to work, documents must be stored
     within the applications document directory.
     */
    func canRenameDocument(
        with fileManager: FileManager = .default
    ) -> Bool {
        guard let url = documentUrl else { return false }
        guard let docsUrl = fileManager.documentDirectoryUrl else { return false }
        let docUrl = docsUrl.appendingPathComponent(url.lastPathComponent)
        return fileManager.fileExists(atPath: docUrl.path)
    }
    
    /**
     Rename the currently presented document.
     
     If no `newExtension` is provided, the file will use the
     same file extension as before.
     
     For document renaming to work, documents must be stored
     within the applications document directory.
     */
    func renameDocument(
        to newFileName: String,
        newExtension: String? = nil,
        with fileManager: FileManager = .default
    ) throws {
        guard let oldUrl = documentUrl else { throw DocumentRenameError.noDocumentUrl }
        let oldPath = oldUrl.path
        let oldExtension = oldUrl.pathExtension
        let newUrl = URL(fileURLWithPath: oldPath)
            .deletingLastPathComponent()
            .appendingPathComponent(newFileName)
            .appendingPathExtension(newExtension ?? oldExtension)
        try fileManager.moveItem(atPath: oldPath, toPath: newUrl.path)
    }
}

private extension FileManager {
    
    var documentDirectoryUrl: URL? {
        try? url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true)
    }
}
