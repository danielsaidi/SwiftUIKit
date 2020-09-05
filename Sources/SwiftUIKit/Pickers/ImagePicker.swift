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
 This image picker presents a `UIImagePickerController` with
 a bindable image and a custom completion handler.
 
 The picker can present error alerts. These titles and texts
 can be localized with the `ImagePicker.Localization` struct.
 */
public struct ImagePicker: UIViewControllerRepresentable {
    
    public init(
        image: Binding<UIImage?>,
        completionHandler: ImagePickerCompletionHandler = ImagePickerStandardCompletionHandler(),
        localization: Localization) {
        self._image = image
        self.completionHandler = completionHandler
        self.localization = localization
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding private(set) var image: UIImage?
    private let completionHandler: ImagePickerCompletionHandler
    private let localization: Localization
    
    public typealias Context = UIViewControllerRepresentableContext<ImagePicker>
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        performPermissionChecksAfterDelay(for: picker)
        return picker
    }

    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}


// MARK: - Localization

public extension ImagePicker {

    struct Localization {
        
        public init(
            missingPhotoLibraryAuthorizationAlertTitle: String,
            missingPhotoLibraryAuthorizationAlertText: String,
            ok: String) {
            self.missingPhotoLibraryAuthorizationAlertTitle = missingPhotoLibraryAuthorizationAlertTitle
            self.missingPhotoLibraryAuthorizationAlertText = missingPhotoLibraryAuthorizationAlertText
            self.ok = ok
        }
        
        let missingPhotoLibraryAuthorizationAlertTitle: String
        let missingPhotoLibraryAuthorizationAlertText: String
        let ok: String
    }
}

// MARK: - Coordinator

public extension ImagePicker {
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        let parent: ImagePicker
        
        public func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            defer { parent.dismiss() }
            let handler = self.parent.completionHandler
            handler.tryGetImage(from: info) { image in
                self.parent.image = image
            }
        }
    }
}


// MARK: - Private Functions

private extension ImagePicker {
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func performPermissionChecksAfterDelay(for picker: UIImagePickerController) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.validatePhotoAlbumAuthorizationIfNeeded(for: picker)
            self.requestPhotoAlbumAuthorizationIfNeeded(for: picker)
        }
    }
    
    func requestPhotoAlbumAuthorizationIfNeeded(for picker: UIImagePickerController) {
        guard completionHandler.requiresAuthorization else { return }
        picker.requestPhotoAlbumAuthorization(localization: localization)
    }
    
    func validatePhotoAlbumAuthorizationIfNeeded(for picker: UIImagePickerController) {
        guard completionHandler.requiresAuthorization else { return }
        picker.validatePhotoAlbumAuthorization(localization: localization)
    }
}


// MARK: - UIImagePickerController Extensions

private extension UIImagePickerController {
    
    var authStatus: PHAuthorizationStatus {
        PHPhotoLibrary.authorizationStatus()
    }
    
    func requestPhotoAlbumAuthorization(localization: ImagePicker.Localization) {
        guard authStatus == .notDetermined else { return }
        PHPhotoLibrary.requestAuthorization { [weak self] _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self?.validatePhotoAlbumAuthorization(localization: localization)
            }
        }
    }
    
    func validatePhotoAlbumAuthorization(localization: ImagePicker.Localization) {
        guard authStatus == .restricted || authStatus == .denied else { return }
        let title = localization.missingPhotoLibraryAuthorizationAlertTitle
        let text = localization.missingPhotoLibraryAuthorizationAlertText
        let ok = localization.ok
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: ok, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
#endif
