//
//  SwiftUIPreviewInspector.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-11-01.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This protocol can be implemented by types that can check
/// if the code is running in a SwiftUI preview.
///
/// The protocol is implemented by `ProcessInfo`.
public protocol SwiftUIPreviewInspector {

    /// Whether or not the code runs in a SwiftUI preview.
    var isSwiftUIPreview: Bool { get }
}

public extension SwiftUIPreviewInspector {

    /// Whether or not the code runs in a SwiftUI preview.
     var isSwiftUIPreview: Bool {
        ProcessInfo.isSwiftUIPreview
    }
}

extension ProcessInfo: SwiftUIPreviewInspector {}

public extension ProcessInfo {

    /// Whether or not the code runs in a SwiftUI preview.
    var isSwiftUIPreview: Bool {
        environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }

    /// Whether or not the code runs in a SwiftUI preview.
    static var isSwiftUIPreview: Bool {
        processInfo.isSwiftUIPreview
    }
}

#Preview {

    VStack {
        Text("Preview.IsSwiftUIPreview", bundle: .module)
            .font(.title)
        Text("\(ProcessInfo.processInfo.isSwiftUIPreview ? "Preview.Yes" : "Preview.No")", bundle: .module)
    }
}
