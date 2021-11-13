//
//  ProcessInfo+Preview.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-04-13.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

public extension ProcessInfo {
    
    /**
     Whether or not the current process is a SwiftUI preview
     process.
     
     You can check this in your Swift code, as such:
     
     ```swift
     if ProcessInfo.processInfo.isSwiftUIPreview { ... }
     ```
     
     This can be used to customize some logic based on if it
     is used in a preview or not.
     */
    var isSwiftUIPreview: Bool {
        environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}
