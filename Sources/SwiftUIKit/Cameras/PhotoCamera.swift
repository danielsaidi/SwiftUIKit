//
//  Camera.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import Photos
import SwiftUI
import UIKit

/**
 This camera is an alias for an `ImagePicker` with `.camera`
 as `sourceType`.
 
 You create a camera instance by providing two action blocks
 that can be used to inspect what happens with the operation:
 
 ```swift
 let picker = Camera(
    cancelAction: { print("User did cancel") }  // Optional
    finishAction: { result in ... })            // Mandatory
 }
 ```
 
 The camera result contains the picked image, which you then
 can use in any way you want.
 
 You can use a ``SheetContext`` to easily present the camera
 as a modal sheet.
 */
public struct PhotoCamera: View {
    
    public init(
        cancelAction: @escaping ImagePicker.CancelAction = {},
        resultAction: @escaping ImagePicker.ResultAction) {
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
            resultAction: resultAction)
    }
}
#endif
