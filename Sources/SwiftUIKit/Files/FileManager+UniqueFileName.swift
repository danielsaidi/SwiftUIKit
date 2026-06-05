//
//  FileManager+UniqueFileName.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-01-18.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import Foundation

public extension FileManager {
    
    /// Get a guaranteed unique url for any `url`.
    ///
    /// The function will check if a conflicting file exists,
    /// and if so increment a counter until there is no file
    /// or filder with the same name.
    func getUniqueDestinationUrl(
        forSuggested url: URL,
        separator: String = "-"
    ) -> URL {
        if !fileExists(atPath: url.path) { return url }
        let fileExtension = url.pathExtension
        let noExtension = url.deletingPathExtension()
        let fileName = noExtension.lastPathComponent
        var counter = 1
        repeat {
            let newUrl = noExtension
                .deletingLastPathComponent()
                .appendingPathComponent(fileName.appending("\(separator)\(counter)"))
                .appendingPathExtension(fileExtension)
            if !fileExists(atPath: newUrl.path) { return newUrl }
            counter += 1
        } while true
    }
}
