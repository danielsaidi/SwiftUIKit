//
//  URL+iCloud.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-04-17.
//  Copyright 2021-2026 Daniel Saidi. All rights reserved.
//

import Foundation

public extension URL {
    
    /// The iCloud ubiquity container URL.
    static func ubiquityContainerUrl(
        for manager: FileManager = .default,
        containerId: String? = nil
    ) -> URL? {
        manager.url(forUbiquityContainerIdentifier: nil)
    }
    
    /// The iCloud ubiquity container Documents root URL.
    static func ubiquityContainerDocumentsUrl(
        for manager: FileManager = .default,
        containerId: String? = nil
    ) -> URL? {
        ubiquityContainerUrl(for: manager, containerId: containerId)?
            .appendingPathComponent("Documents")
    }
    
    /// The url to a local document fallback directory, that
    /// can be used when the `ubiquityContainer` url is `nil`.
    static func ubiquityContainerDocumentsLocalFallbackUrl(
        for manager: FileManager = .default
    ) -> URL? {
        manager.urls(for: .documentDirectory, in: .userDomainMask).first
    }
}
