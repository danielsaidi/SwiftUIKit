//
//  FormTextEditor.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-03.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used to present text fields in a list form.
 */
@available(iOS 14, *)
public struct FormTextEditor: View {
    
    public init(
        title: String,
        text: Binding<String>,
        editorHeight: CGFloat = 100) {
        self.title = title
        self._text = text
        self.editorHeight = editorHeight
    }
    
    private let title: String
    private let editorHeight: CGFloat
    
    @Binding private var text: String
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.footnote)
                .textCase(.lowercase)
                .foregroundColor(.secondary)
            TextEditor(text: $text)
                .frame(height: editorHeight)
        }.padding(.vertical, 3)
    }
}

@available(iOS 14, *)
struct FormTextEditor_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State private var text = "Text"
        
        var body: some View {
            FormTextEditor(
                title: "Title",
                text: $text)
        }
    }
    
    static var previews: some View {
        List {
            Preview()
        }
    }
}
