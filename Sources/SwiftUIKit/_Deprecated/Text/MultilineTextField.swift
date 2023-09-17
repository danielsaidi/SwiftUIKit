//
//  MultilineTextField.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-08.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

@available(*, deprecated, message: "Multiline is supported by TextField in iOS 16 and later")
public struct MultilineTextField: UIViewRepresentable {
    
    public init(
        text: Binding<String>,
        configuration: @escaping Configuration = { _ in }
    ) {
        self._text = text
        self.configuration = configuration
    }
    
    @Binding
    public var text: String

    private let configuration: Configuration
    
    public typealias Configuration = (UITextView) -> Void

    public func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.delegate = context.coordinator
        return view
    }
    
    public class Coordinator: NSObject, UITextViewDelegate {
        
        public init(text: Binding<String>) {
            self._text = text
        }
    
        @Binding public var text: String
        
        public func textViewDidChange(_ textView: UITextView) {
            text = textView.text
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }

    public func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        configuration(uiView)
    }
}
#endif
