//
//  Bundle+Information.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-09.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Bundle {
    
    /// Get the bundle build number string, e.g. `123`.
    var buildNumber: String {
        let key = String(kCFBundleVersionKey)
        let version = infoDictionary?[key] as? String
        return version ?? ""
    }
    
    /// Get the bundle display name, if any.
    var displayName: String {
        infoDictionary?["CFBundleDisplayName"] as? String ?? "-"
    }
    
    /// Get the bundle version number string, e.g. `1.2.3`.
    var versionNumber: String {
        let key = "CFBundleShortVersionString"
        let version = infoDictionary?[key] as? String
        return version ?? "0.0.0"
    }
}
