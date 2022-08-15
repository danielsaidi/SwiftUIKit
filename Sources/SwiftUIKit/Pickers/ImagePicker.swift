//
//  ImagePicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-04-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import Photos
import SwiftUI
import UIKit

/**
 This picker wraps a `UIImagePickerController`, which can be
 used to pick an images from photos, the camera etc.
 
 You create a picker instance by providing two action blocks
 that can be used to inspect what happens with the operation,
 as well as the desired source type:
 
 ```swift
 let picker = ImagePicker(
    sourceType: .camera,
    cancelAction: { print("User did cancel") }  // Optional
    finishAction: { result in ... })            // Mandatory
 }
 ```
 
 The picker result contains the picked image, which you then
 can use in any way you want.
 
 You can use a ``SheetContext`` to easily present the picker
 as a modal sheet.
 */
public struct ImagePicker: UIViewControllerRepresentable {
    
    public init(
        sourceType: UIImagePickerController.SourceType,
        cancelAction: @escaping CancelAction = {},
        resultAction: @escaping ResultAction
    ) {
        self.sourceType = sourceType
        self.cancelAction = cancelAction
        self.resultAction = resultAction
    }
    
    public typealias PickerResult = Result<ImageRepresentable, Error>
    public typealias CancelAction = () -> Void
    public typealias ResultAction = (PickerResult) -> Void
    
    public enum PickerError: Error {
        case missingPhotoLibraryPermissions
        case missingPickedImage
    }
    
    private let sourceType: UIImagePickerController.SourceType
    private let cancelAction: CancelAction
    private let resultAction: ResultAction
        
    public func makeCoordinator() -> Coordinator {
        Coordinator(picker: self)
    }

    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }

    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

/**
 This enum is used to handle ``ImagePicker`` specific errors.
 */
public enum ImagePickerError {

    case hasNoPhotoLibraryAccess(status: PHAuthorizationStatus)
}

public extension ImagePicker {

    /**
     Get a collection of available image picker source types
     that have been verified to work with this picker.
     */
    static var allSourceTypes: [UIImagePickerController.SourceType] {
        [.camera, .photoLibrary, .savedPhotosAlbum]
    }

    /**
     Get a collection of available image picker source types
     that have been verified to work with this picker.
     */
    static var availableSourceTypes: [UIImagePickerController.SourceType] {
        allSourceTypes.filter(UIImagePickerController.isSourceTypeAvailable)
    }
}


// MARK: - Coordinator

public extension ImagePicker {
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        public init(picker: ImagePicker) {
            self.picker = picker
        }
        
        private let picker: ImagePicker
        
        public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.picker.cancelAction()
        }
        
        public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                self.picker.resultAction(.success(image))
            } else {
                let error = PickerError.missingPickedImage
                self.picker.resultAction(.failure(error))
            }
        }
    }
}
#endif
