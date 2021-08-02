//
//  FormText.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-03.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This view can be used to present text values in a list form.
 
 If `hideIfEmpty` is `true` and `text` is empty, the view is
 rendered as an `EmptyView`.
 */
@available(iOS 14, *)
public struct FormText: View {
    
    public init(
        title: String,
        text: String,
        hideIfEmpty: Bool = true) {
        self.title = title
        self.text = text
        self.hideIfEmpty = hideIfEmpty
    }
    
    private let title: String
    private let text: String
    private let hideIfEmpty: Bool
    
    public var body: some View {
        if hasEmptyText && hideIfEmpty {
            EmptyView()
        } else {
            stack
        }
    }
}

@available(iOS 14, *)
extension FormText {
    
    var hasEmptyText: Bool {
        text.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var stack: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.footnote)
                .textCase(.lowercase)
                .foregroundColor(.secondary)
            Text(text)
        }.padding(.vertical, 3)
    }
}

@available(iOS 14, *)
struct FormText_Previews: PreviewProvider {
    
    static var previews: some View {
        List {
            FormText(
                title: "Title 1",
                text: "Text value")
            FormText(
                title: "Title 2",
                text: "")
            FormText(
                title: "Title 3",
                text: "",
                hideIfEmpty: false)
        }
    }
}
#endif
