//
//  Camera.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import Photos
import SwiftUI

/**
 This view can be used to open a camera that can take photos.

 You create a camera instance by providing two action blocks:
 
 ```swift
 let picker = Camera(
    cancelAction: { print("User did cancel") }  // Optional
    finishAction: { result in ... })            // Mandatory
 }
 ```

 You can then present this camera with a sheet, a modal, etc.
 
 This camera returns a result that contains the picked image,
 which you then can use in any way you want.
 */
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
