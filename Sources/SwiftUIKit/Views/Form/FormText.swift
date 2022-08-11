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
 
 You can use the `text` property to get the current text and
 handle it in various ways, e.g. copying it.
 
 If `hideIfEmpty` is `true` and `text` is empty, the view is
 rendered as an `EmptyView`.
 */
public struct FormText<TrailingView: View>: View {
    
    public init(
        title: String,
        text: String,
        hideIfEmpty: Bool = false,
        trailingView: @escaping TrailingViewBuilder
    ) {
        self.title = title
        self.text = text
        self.hideIfEmpty = hideIfEmpty
        self.trailingView = trailingView
    }
    
    public let text: String
    
    private let title: String
    private let hideIfEmpty: Bool
    private let trailingView: TrailingViewBuilder?
    
    public typealias TrailingViewBuilder = () -> TrailingView
    
    public var body: some View {
        if hasEmptyText && hideIfEmpty {
            EmptyView()
        } else {
            stack
        }
    }
}

public extension FormText {
    
    var hasEmptyText: Bool {
        text.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

public extension FormText where TrailingView == EmptyView {
    
    init(
        title: String,
        text: String,
        hideIfEmpty: Bool = false
    ) {
        self.title = title
        self.text = text
        self.hideIfEmpty = hideIfEmpty
        self.trailingView = nil
    }
}

private extension FormText {
    
    var stack: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text(title.lowercased())
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text(text)
            }
            if let trailing = trailingView {
                Spacer()
                trailing()
            }
        }
        .padding(.vertical, 3)
    }
}

struct FormText_Previews: PreviewProvider {
    
    static var action: (() -> Void) = {}
    
    static var previews: some View {
        List {
            FormText(
                title: "Title 1",
                text: "Text value")
            FormText(
                title: "Title 2",
                text: "A looong text value with a trailing view.") {
                Button(action: {}, label: { Image(systemName: "doc.on.doc") })
            }
            FormText(
                title: "Title 3",
                text: "Long\nmultuline\ntext that could have been entered in a text editor.")
            FormText(
                title: "Title 4",
                text: "",
                hideIfEmpty: true)
            FormText(
                title: "Title 5",
                text: "",
                hideIfEmpty: false)
        }
    }
}
#endif
