//
//  ImagePicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-04-07.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import Photos
import SwiftUI
import UIKit


@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
public struct ImagePicker: UIViewControllerRepresentable {
    
    /// Create an image picker.
    ///
    /// - Parameters:
    ///   - sourceType: The image source type to pick.
    ///   - pickerConfig: A custom picker configuration, if any.
    ///   - cancelAction: The cancel action to trigger, if any.
    ///   - resultAction: The result action to trigger, if any.
    public init(
        sourceType: UIImagePickerController.SourceType,
        pickerConfig: @escaping PickerConfig = { _ in },
        cancelAction: @escaping CancelAction = {},
        resultAction: @escaping ResultAction
    ) {
        self.sourceType = sourceType
        self.pickerConfig = pickerConfig
        self.cancelAction = cancelAction
        self.resultAction = resultAction
    }
    
    public typealias PickerConfig = (UIImagePickerController) -> Void
    public typealias PickerResult = Result<ImageRepresentable, Error>
    public typealias CancelAction = () -> Void
    public typealias ResultAction = (PickerResult) -> Void
    
    private let sourceType: UIImagePickerController.SourceType
    private let pickerConfig: PickerConfig
    private let cancelAction: CancelAction
    private let resultAction: ResultAction
        
    public func makeCoordinator() -> Coordinator {
        Coordinator(picker: self)
    }

    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = sourceType
        controller.delegate = context.coordinator
        pickerConfig(controller)
        return controller
    }

    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
public extension ImagePicker {
    
    /// This enum defines ``ImagePicker``-specific errors.
    enum PickerError: Error {
        case missingPhotoLibraryPermissions
        case missingPickedImage
    }

    /// Get all source types that work with the picker.
    static var allSourceTypes: [UIImagePickerController.SourceType] {
        [.camera, .photoLibrary, .savedPhotosAlbum]
    }

    /// Get all source types that are enabled for the picker.
    static var availableSourceTypes: [UIImagePickerController.SourceType] {
        allSourceTypes.filter(UIImagePickerController.isSourceTypeAvailable)
    }

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
