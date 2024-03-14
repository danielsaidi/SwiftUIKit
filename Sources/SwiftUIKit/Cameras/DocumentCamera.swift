//
//  DocumentCamera.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-01-22.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI
import VisionKit

/**
 This view can be used to open a camera that can scan one or
 multiple pages in a physical document.

 You create a document camera by providing two action blocks:
 
 ```swift
 let camera = DocumentCamera(
    cancelAction: { print("User did cancel") }  // Optional
    resultAction: { result in ... }             // Mandatory
 }
 ```

 You can then present this camera with a sheet, a modal, etc.

 The camera uses a `VNDocumentCameraViewController` and will
 return a `VNDocumentCameraScan` with all document pages.
 */
public struct DocumentCamera: UIViewControllerRepresentable {

    /// Create a document camera.
    ///
    /// - Parameters:
    ///   - cancelAction: The action to trigger when the scan is cancelled.
    ///   - resultAction: The action to trigger when the scan is completes.
    public init(
        cancelAction: @escaping CancelAction = {},
        resultAction: @escaping ResultAction
    ) {
        self.cancelAction = cancelAction
        self.resultAction = resultAction
    }
    
    public typealias CameraResult = Result<VNDocumentCameraScan, Error>
    public typealias CancelAction = () -> Void
    public typealias ResultAction = (CameraResult) -> Void
    
    private let cancelAction: CancelAction
    private let resultAction: ResultAction
        
    public func makeCoordinator() -> Coordinator {
        Coordinator(
            cancelAction: cancelAction,
            resultAction: resultAction
        )
    }
    
    public func makeUIViewController(
        context: Context
    ) -> VNDocumentCameraViewController {
        let controller = VNDocumentCameraViewController()
        controller.delegate = context.coordinator
        return controller
    }
    
    public func updateUIViewController(
        _ uiViewController: VNDocumentCameraViewController,
        context: Context
    ) {}
}

public extension DocumentCamera {
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        
        public init(
            cancelAction: @escaping DocumentCamera.CancelAction,
            resultAction: @escaping DocumentCamera.ResultAction
        ) {
            self.cancelAction = cancelAction
            self.resultAction = resultAction
        }
        
        private let cancelAction: DocumentCamera.CancelAction
        private let resultAction: DocumentCamera.ResultAction

        public func documentCameraViewControllerDidCancel(
            _ controller: VNDocumentCameraViewController
        ) {
            cancelAction()
        }
        
        public func documentCameraViewController(
            _ controller: VNDocumentCameraViewController,
            didFailWithError error: Error
        ) {
            resultAction(.failure(error))
        }
        
        public func documentCameraViewController(
            _ controller: VNDocumentCameraViewController,
            didFinishWith scan: VNDocumentCameraScan
        ) {
            resultAction(.success(scan))
        }
    }
}
#endif
