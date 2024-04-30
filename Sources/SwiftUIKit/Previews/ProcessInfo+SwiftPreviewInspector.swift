//
//  ProcessInfo+Preview.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-04-13.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

extension ProcessInfo: SwiftPreviewInspector {}

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
