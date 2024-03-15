//
//  FormText.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-03.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This view can be used to present action rows in a `List`.
 
 If `hideIfEmpty` is `true` and the text is empty, this view
 is rendered as an `EmptyView`.
 */
public struct ListActionRow: View {
    
    /// Create a list action row with a custom trailing view.
    ///
    /// - Parameters:
    ///   - title: The row title.
    ///   - text: The row text.
    ///   - action: The ``ListAction`` to use.
    ///   - hideIfEmpty: Whether or not to hide the view if the text is empty, by default `false`.
    ///   - trailingView: An optional trailing view to apply to the view.
    public init(
        title: String,
        text: String,
        action: ListAction?,
        hideIfEmpty: Bool = false
    ) {
        self.title = title
        self.text = text
        self.action = action
        self.hideIfEmpty = hideIfEmpty
    }
    
    private let text: String
    private let title: String
    private let hideIfEmpty: Bool
    private let action: ListAction?
    
    public var body: some View {
        if hasEmptyText && hideIfEmpty {
            EmptyView()
        } else {
            stack
        }
    }
}

private extension ListActionRow {

    var hasEmptyText: Bool {
        text.trimmingCharacters(in: .whitespaces)
            .isEmpty
    }
    
    var stack: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .lineLimit(1)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text(text)
            }
            
            if let action {
                Spacer()
                action.button
            }
        }
        .padding(.vertical, 3)
    }
}

#Preview {
    
    List {
        ListActionRow(
            title: "Title 1",
            text: "Text 1",
            action: .call(phoneNumber: "1234")
        )
        
        ListActionRow(
            title: "Title 2",
            text: "Text 2",
            action: .copy("")
        )
        .buttonStyle(.borderedProminent)
        
        ListActionRow(
            title: "Title 3",
            text: "Long\nmultuline\ntext that could have been entered in a text editor.",
            action: .email(address: "")
        )
        
        ListActionRow(
            title: "Title 4",
            text: "",
            action: nil,
            hideIfEmpty: true
        )
        
        ListActionRow(
            title: "Title 5",
            text: "",
            action: nil,
            hideIfEmpty: false
        )
    }
}
#endif
