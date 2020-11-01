//
//  DocumentCamera.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-01-22.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI
import VisionKit

/**
 This view creates a `VNDocumentCameraViewController`, which
 can be used to scan documents with the device's camera.
 
 You can provide any `VNDocumentCameraViewControllerDelegate`
 you want, but the easiest and most convenient way is to use
 a `DocumentCamera.Delegate` instance.

 You can use this view with `SheetContext` to easily present
 it as a modal sheet.
 */
@available(iOS 13, *)
public struct DocumentCamera: UIViewControllerRepresentable {
    
    public init(delegate: VNDocumentCameraViewControllerDelegate) {
        self.delegateRetainer = delegate
    }
    
    private let delegateRetainer: VNDocumentCameraViewControllerDelegate
    
    public func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let controller = VNDocumentCameraViewController()
        controller.delegate = delegateRetainer
        return controller
    }
    
    public func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {}
}

@available(iOS 13, *)
public extension DocumentCamera {
    
    class Delegate: NSObject, VNDocumentCameraViewControllerDelegate {
        
        public init(
            didCancel: @escaping () -> Void,
            didFail: @escaping (Error) -> Void,
            didFinish: @escaping (VNDocumentCameraScan) -> Void) {
            self.didCancel = didCancel
            self.didFail = didFail
            self.didFinish = didFinish
        }
        
        private let didCancel: () -> Void
        private let didFail: (Error) -> Void
        private let didFinish: (VNDocumentCameraScan) -> Void
        
        public func documentCameraViewControllerDidCancel(
            _ controller: VNDocumentCameraViewController) {
            didCancel()
        }
        
        public func documentCameraViewController(
            _ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            didFail(error)
        }
        
        public func documentCameraViewController(
            _ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            didFinish(scan)
        }
    }
}
#endif
