//
//  FileManager+UniqueFileName.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-01-18.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import Foundation

public extension FileManager {
    
    /// Get a unique url for any `url` to ensure that no pre-existing item exists.
    ///
    /// The function will increment a counter as long as a file or directory exists,
    /// and add it as a file suffix, using the `suffixSeparator` as separator.
    ///
    /// For instance, if you try to to save a file at a URL where another file exists,
    /// this will first add `-1` as file name suffix to check if another file with that
    /// name exists. It continues with `-2`, `-3` etc. until no file is found.
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
