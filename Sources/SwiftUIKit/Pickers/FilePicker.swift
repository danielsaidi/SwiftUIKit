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
 This file picker presents a `UIDocumentPickerViewController`
 with a generic, bindable value and a data handler that will
 be used to convert the picker file data to the desired type.
 
 For instance, if you want the file picker to only let users
 pick `png` files then bind the picked image file to `$image`,
 create it like this:
 
 ```swift
 let picker = FilePicker(value: $image, documentTypes: ["public.png"]) {
    UIImage(data: $0)
 }
 ```
 */
public struct FilePicker<Type>: UIViewControllerRepresentable {
    
    public init(
        value: Binding<Type?>,
        documentTypes: [String],
        dataHandler: @escaping DataHandler) {
        self._value = value
        self.documentTypes = documentTypes
        self.dataHandler = dataHandler
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding private(set) var value: Type?
    private let documentTypes: [String]
    private let dataHandler: DataHandler
    
    public typealias Context = UIViewControllerRepresentableContext<FilePicker>
    public typealias DataHandler = (Data) -> Type?
        
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(documentTypes: documentTypes, in: .import)
        picker.delegate = context.coordinator
        return picker
    }

    public func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
}


// MARK: - Coordinator

public extension FilePicker {
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIDocumentPickerDelegate {

        init(_ parent: FilePicker) {
            self.parent = parent
        }
        
        let parent: FilePicker
        
        public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let url = urls.first else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            self.parent.value = self.parent.dataHandler(data)
        }
    }
}


// MARK: - Private Functions

private extension FilePicker {
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}
#endif
