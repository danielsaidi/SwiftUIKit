//
//  FormTextEditor.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-03.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This view can be used to present text fields in a list form.
 */
@available(iOS 14, *)
public struct FormTextEditor: View {
    
    public init(
        title: String,
        text: Binding<String>,
        editorHeight: CGFloat = 100
    ) {
        self.title = title
        self._text = text
        self.editorHeight = editorHeight
    }
    
    private let title: String
    private let editorHeight: CGFloat
    
    @Binding
    private var text: String
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.footnote)
                .textCase(.lowercase)
                .foregroundColor(.secondary)
            TextEditor(text: $text)
                .frame(height: editorHeight)
                .padding(.vertical, -6)
                .padding(.leading, -5)
        }.padding(.vertical, 1)
    }
}

@available(iOS 14, *)
struct FormTextEditor_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State private var text = """
When I look into your eyes
I can see a love restrained
But darlin' when I hold you
Don't you know I feel the same?

Nothin' lasts forever
And we both know hearts can change
And it's hard to hold a candle
In the cold November rain
"""
        
        var body: some View {
            FormText(
                title: "Viewer",
                text: text)
            FormTextEditor(
                title: "Editor",
                text: $text,
                editorHeight: 150)
        }
    }
    
    static var previews: some View {
        ZStack(alignment: .leading) {
            List {
                Preview()
            }
            Color.red
                .frame(width: 10)
                .offset(x: 22)
                .opacity(0)
        }
    }
}
#endif
