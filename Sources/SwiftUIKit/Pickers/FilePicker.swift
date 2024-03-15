//
//  FilePicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-04-07.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI
import UIKit
import UniformTypeIdentifiers

/**
 This picker can be used to pick files from Files.
 
 The view wraps a `UIDocumentPickerViewController` and makes
 itself the delegate.
 
 You can create a picker by providing the types of documents
 you want it to support, such as `["public.png"]` as well as
 two action blocks for handling cancel and completion events:
 
 ```swift
 let picker = FilePicker(
    documentTypes: ["public.png"],
    cancelAction: { print("User did cancel") }  // Optional
    finishAction: { result in ... })            // Mandatory
 }
 ```
 
 The picker result contains a list of file urls that you can
 handle in any way  you want.
 */
public struct FilePicker: UIViewControllerRepresentable {
    
    /// Create a file picker.
    ///
    /// - Parameters:
    ///   - documentTypes: The uniform types to pick.
    ///   - pickerConfig: A custom picker configuration, if any.
    ///   - cancelAction: The cancel action to trigger, if any.
    ///   - resultAction: The result action to trigger, if any.
    public init(
        documentTypes: [UTType],
        pickerConfig: @escaping PickerConfig = { _ in },
        cancelAction: @escaping CancelAction = {},
        resultAction: @escaping ResultAction
    ) {
        self.documentTypes = documentTypes
        self.pickerConfig = pickerConfig
        self.cancelAction = cancelAction
        self.resultAction = resultAction
    }
    
    public typealias PickerConfig = (UIDocumentPickerViewController) -> Void
    public typealias PickerResult = Result<[URL], Error>
    public typealias CancelAction = () -> Void
    public typealias ResultAction = (PickerResult) -> Void
    
    public enum PickerError: Error {
        case noAvailableUrl
    }
    
    private let documentTypes: [UTType]
    private let pickerConfig: PickerConfig
    private let cancelAction: CancelAction
    private let resultAction: ResultAction
        
    public func makeCoordinator() -> Coordinator {
        Coordinator(picker: self)
    }

    public func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let controller = UIDocumentPickerViewController(forOpeningContentTypes: documentTypes)
        controller.delegate = context.coordinator
        pickerConfig(controller)
        return controller
    }

    public func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
}

public extension FilePicker {
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIDocumentPickerDelegate {

        public init(picker: FilePicker) {
            self.picker = picker
        }
        
        private let picker: FilePicker
        
        public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            picker.cancelAction()
        }
        
        public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            picker.resultAction(.success(urls))
        }
    }
}
#endif
