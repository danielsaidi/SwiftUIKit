//
//  ListActionRow.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-03.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/// This view can be used to present action rows in a `List`.
public struct ListActionRow: View {
    
    /// Create a list action row with a custom trailing view.
    ///
    /// - Parameters:
    ///   - title: The row title, if any.
    ///   - text: The row text.
    ///   - bundle: The bundle to use for localization, if any.
    ///   - action: The ``ListAction`` to use, if any.
    public init(
        title: LocalizedStringKey? = nil,
        text: LocalizedStringKey,
        bundle: Bundle? = nil,
        action: ListAction? = nil
    ) {
        self.title = title
        self.text = text
        self.bundle = bundle
        self.action = action
    }
    
    private let title: LocalizedStringKey?
    private let text: LocalizedStringKey
    private let bundle: Bundle?
    private let action: ListAction?
    
    public var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                if let title {
                    Text(title, bundle: bundle)
                        .lineLimit(1)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
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
            text: "Preview.Text.\(2)",
            bundle: .module,
            action: .copy("")
        )
        .buttonStyle(.borderedProminent)
        
        ListActionRow(
            text: "Preview.Text.\(2) Preview.Text.\(2) Preview.Text.\(2) Preview.Text.\(2) Preview.Text.\(2)  Preview.Text.\(2)  Preview.Text.\(2) ",
            bundle: .module,
            action: .email(address: "")
        )
        
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
