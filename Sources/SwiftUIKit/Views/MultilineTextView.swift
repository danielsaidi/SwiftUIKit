//
//  MultilineTextView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-08.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view wraps a `UITextView` and provides multi-line text
 editing.
 
 For now, this view does not adapt size as text changes. You
 can specify a fixed size with the `frame` modifier. You can
 configure the text view by providing a `configuration` when
 you create the view.
 */
public struct MultilineTextView: UIViewRepresentable {
    
    public init(
        text: Binding<String>,
        configuration: Configuration = { _ in }) {
        self._text = text
    }
    
    @Binding public var text: String
    
    public typealias Configuration = (UITextView) -> ()

    public func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        return view
    }

    public func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
