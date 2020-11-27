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
 that can be used to inspect what happens with the operation:
 
 ```swift
 let picker = ImagePicker(
    sourceType: .camera,
    cancelAction: { print("User did cancel") }  // Optional
    finishAction: { result in ... })            // Mandatory
 }
 ```
 
 The picker result contains the picked image, which you then
 can use in any way you want.
 
 You can use this view with `SheetContext` to easily present
 it as a modal sheet.
 */
public struct ImagePicker: UIViewControllerRepresentable, DismissableView {
    
    public init(
        sourceType: UIImagePickerController.SourceType,
        cancelAction: @escaping CancelAction = {},
        resultAction: @escaping ResultAction) {
        self.sourceType = sourceType
        self.cancelAction = cancelAction
        self.resultAction = resultAction
    }
    
    public typealias PickerResult = Result<Image, Error>
    public typealias CancelAction = () -> Void
    public typealias ResultAction = (PickerResult) -> Void
    
    public enum PickerError: Error {
        case missingPhotoLibraryPermissions
        case missingPickedImage
    }
    
    private let sourceType: UIImagePickerController.SourceType
    private let cancelAction: CancelAction
    private let resultAction: ResultAction
    
    @Environment(\.presentationMode) public var presentationMode
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(
            cancelAction: cancelAction,
            resultAction: resultAction)
    }

    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        //performPermissionChecksAfterDelay(for: picker)
        return picker
    }

    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}


// MARK: - Coordinator

public extension ImagePicker {
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        public init(
            cancelAction: @escaping CancelAction,
            resultAction: @escaping ResultAction) {
            self.cancelAction = cancelAction
            self.resultAction = resultAction
        }
        
        private let cancelAction: CancelAction
        private let resultAction: ResultAction
        
        public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            cancelAction()
        }
        
        public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let rawImage = info[.originalImage] as? UIImage {
                let image = Image(uiImage: rawImage)
                return resultAction(.success(image))
            }
            
//            let missingImageError = PickerError.missingPickedImage
//
//
//            guard let asset = info[.phAsset] as? PHAsset else { return resultAction(.failure(missingImageError)) }
//            let manager = PHImageManager.default()
//            let options = PHImageRequestOptions()
//            options.version = .original
//            options.isSynchronous = true
//            options.resizeMode = .none
//            manager.requestImageDataAndOrientation(for: asset, options: options) { data, _, _, _ in
//                guard
//                    let data = data,
//                    let image = UIImage(data: data)
//                else { return self.resultAction(.failure(missingImageError)) }
//                self.resultAction(.success(Image(uiImage: image)))
//            }
        }
    }
}


// MARK: - Private Functions

private extension ImagePicker {
    
//    var authStatus: PHAuthorizationStatus {
//        PHPhotoLibrary.authorizationStatus()
//    }
//
//    func performPermissionChecksAfterDelay(for picker: UIImagePickerController) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.validatePhotoAlbumAuthorizationIfNeeded(for: picker)
//            //self.requestPhotoAlbumAuthorizationIfNeeded(for: picker)
//        }
//    }
//
//    //func requestPhotoAlbumAuthorizationIfNeeded(for picker: UIImagePickerController) {
//    //    guard completionHandler.requiresAuthorization else { return }
//    //    picker.requestPhotoAlbumAuthorization(localization: localization)
//    //}
//
//    func validatePhotoAlbumAuthorizationIfNeeded(for picker: UIImagePickerController) {
//        let authStatus = picker.authStatus
//        //guard picker.requiresAuthorization else { return }
//        guard authStatus == .restricted || authStatus == .denied else { return }
//        dismiss()
//        resultAction(.failure(PickerError.missingPhotoLibraryPermissions))
//    }
//
//
//
//    func requestPhotoAlbumAuthorization() {
//        guard authStatus == .notDetermined else { return }
//        PHPhotoLibrary.requestAuthorization { [weak self] _ in
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                self?.validatePhotoAlbumAuthorization(localization: localization)
//            }
//        }
//    }
//
//    func validatePhotoAlbumAuthorization(localization: ImagePicker.Localization) {
//        guard authStatus == .restricted || authStatus == .denied else { return }
//
//
//
//        let title = localization.missingPhotoLibraryAuthorizationAlertTitle
//        let text = localization.missingPhotoLibraryAuthorizationAlertText
//        let ok = localization.ok
//        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: ok, style: .default, handler: nil))
//        present(alert, animated: true, completion: nil)
//    }
}
#endif
