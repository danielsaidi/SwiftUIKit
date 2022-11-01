//
//  File.swift
//  
//
//  Created by Daniel Saidi on 2022-11-01.
//

import Foundation

/**
 This class can be used to check if the code is running in a
 SwiftUI preview.
 */
public class StandardSwiftPreviewInspector: SwiftPreviewInspector {

    /**
     Whether or not the code runs in a SwiftUI preview.
     */
    public var isSwiftUIPreview: Bool {
        ProcessInfo.processInfo.isSwiftUIPreview
    }
}
