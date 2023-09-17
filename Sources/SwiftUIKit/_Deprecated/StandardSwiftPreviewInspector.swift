//
//  StandardSwiftPreviewInspector.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-11-01.
//  Copyright © 2022-2023 Daniel Saidi. All rights reserved.
//

import Foundation

@available(*, deprecated, message: "You can just implement SwiftPreviewInspector")
public class StandardSwiftPreviewInspector: SwiftPreviewInspector {

    /// Whether or not the code runs in a SwiftUI preview.
    public var isSwiftUIPreview: Bool {
        ProcessInfo.processInfo.isSwiftUIPreview
    }
}
