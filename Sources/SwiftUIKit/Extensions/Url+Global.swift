//
//  Url+Global.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-08-31.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension URL {
    
    /// The url to the App Store page for a certain app ID.
    static func appStoreUrl(forAppId appId: Int) -> URL? {
        URL(string: "https://itunes.apple.com/app/id\(appId)")
    }
}
