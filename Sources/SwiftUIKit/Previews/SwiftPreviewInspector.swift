//
//  SwiftPreviewInspector.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-11-01.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by types that can check if
 the code is running in a SwiftUI preview.

 The protocol is implemented by `ProcessInfo`.
 */
public protocol SwiftPreviewInspector {

    /// Whether or not the code runs in a SwiftUI preview.
    var isSwiftUIPreview: Bool { get }
}

public extension SwiftPreviewInspector {
    
    /// Whether or not the code runs in a SwiftUI preview.
     var isSwiftUIPreview: Bool {
        ProcessInfo.isSwiftUIPreview
    }
}
