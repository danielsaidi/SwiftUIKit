//
//  KeychainWrapper.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2016-2024 Daniel Saidi. All rights reserved.
//

import Foundation

/// This class can find files witin a certain bundle.
open class BundleFileFinder {
    
    public init(
        bundle: Bundle = .main
    ) {
        self.bundle = bundle
    }
    
    public let bundle: Bundle
    
    /// Find files names that start with a certain prefix.
    open func findFilesWithFileNamePrefix(_ prefix: String) -> [String] {
        let format = "self BEGINSWITH %@"
        let predicate = NSPredicate(format: format, argumentArray: [prefix])
        return findFilesWithPredicate(predicate)
    }
    
    /// Find files names that end with a certain suffix.
    open func findFilesWithFileNameSuffix(_ suffix: String) -> [String] {
        let format = "self ENDSWITH %@"
        let predicate = NSPredicate(format: format, argumentArray: [suffix])
        return findFilesWithPredicate(predicate)
    }
}

private extension BundleFileFinder {
    
    func findFilesWithPredicate(_ predicate: NSPredicate) -> [String] {
        do {
            let path = bundle.bundlePath
            let fileManager = FileManager.default
            let files = try fileManager.contentsOfDirectory(atPath: path)
            let array = files as NSArray
            let filteredFiles = array.filtered(using: predicate)
            return filteredFiles as? [String] ?? []
        } catch {
            return [String]()
        }
    }
}
