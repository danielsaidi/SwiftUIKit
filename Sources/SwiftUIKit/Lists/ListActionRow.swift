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
    ///   - trailingView: An optional trailing view to apply to the view.
    public init(
        title: LocalizedStringKey,
        text: LocalizedStringKey,
        bundle: Bundle? = nil,
        action: ListAction?
    ) {
        self.title = title
        self.text = text
        self.bundle = bundle
        self.action = action
    }
    
    private let title: LocalizedStringKey
    private let text: LocalizedStringKey
    private let bundle: Bundle?
    private let action: ListAction?
    
    public var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text(title, bundle: bundle)
                    .lineLimit(1)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text(text, bundle: bundle)
            }
            
            if let action {
                Spacer()
                action.button
            }
        }
    }
}

#Preview {
    
    List {
        ListActionRow(
            title: "Preview.Title.\(1)",
            text: "Preview.Text.\(1)",
            bundle: .module,
            action: .call(phoneNumber: "1234")
        )
        
        ListActionRow(
            title: "Preview.Title.\(2)",
            text: "Preview.Text.\(2)",
            bundle: .module,
            action: .copy("")
        )
        .buttonStyle(.borderedProminent)
        
        ListActionRow(
            title: "Preview.Title.\(3)",
            text: "Preview.Text.Long",
            bundle: .module,
            action: .email(address: "")
        )
        
        ListActionRow(
            title: "Preview.Title.\(4)",
            text: "Preview.Text.\(4)",
            bundle: .module,
            action: nil
        )
    }
}
#endif
