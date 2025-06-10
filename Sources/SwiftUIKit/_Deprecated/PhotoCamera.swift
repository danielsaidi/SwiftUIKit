//
//  Camera.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import Photos
import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
public struct PhotoCamera: View {

    /// Create a photo camera.
    ///
    /// - Parameters:
    ///   - cancelAction: The action to trigger when the operation is cancelled.
    ///   - resultAction: The action to trigger when the operation is completes.
    public init(
        cancelAction: @escaping ImagePicker.CancelAction = {},
        resultAction: @escaping ImagePicker.ResultAction
    ) {
        self.cancelAction = cancelAction
        self.resultAction = resultAction
    }
    
    public typealias CameraResult = ImagePicker.PickerResult
    
    private let cancelAction: ImagePicker.CancelAction
    private let resultAction: ImagePicker.ResultAction
        
    public var body: some View {
        ImagePicker(
            sourceType: .camera,
            cancelAction: cancelAction,
            resultAction: resultAction
        )
    }
}
#endif
