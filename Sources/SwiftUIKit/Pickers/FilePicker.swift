//
//  FilePicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-04-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI
import UIKit

/**
 This picker wraps `UIDocumentPickerViewController` that can
 can be used to pick files from Files.
 
 You create a picker instance by providing two action blocks
 that can be used to inspect what happens with the operation.
 You must also specify the document types you want to handle
 (`["public.png"]` if you only want to support `.png` files):
 
 ```swift
 let picker = FilePicker(
    documentTypes: ["public.png"],
    cancelAction: { print("User did cancel") }  // Optional
    finishAction: { result in ... })            // Mandatory
 }
 ```
 
 The picker result contains a list of file urls that you can
 handle in any way  you want.
 
 You can use a ``SheetContext`` to easily present the picker
 as a modal sheet.
 */
public struct FilePicker: UIViewControllerRepresentable {
    
    public init(
        documentTypes: [String],
        cancelAction: @escaping CancelAction = {},
        resultAction: @escaping ResultAction
    ) {
        self.documentTypes = documentTypes
        self.cancelAction = cancelAction
        self.resultAction = resultAction
    }
    
    public typealias PickerResult = Result<[URL], Error>
    public typealias CancelAction = () -> Void
    public typealias ResultAction = (PickerResult) -> Void
    
    public enum PickerError: Error {
        case noAvailableUrl
    }
    
    private let documentTypes: [String]
    private let cancelAction: CancelAction
    private let resultAction: ResultAction
        
    public func makeCoordinator() -> Coordinator {
        Coordinator(picker: self)
    }

    public func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let controller = UIDocumentPickerViewController(documentTypes: documentTypes, in: .import)
        controller.delegate = context.coordinator
        return controller
    }

    public func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
}


// MARK: - Coordinator

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
