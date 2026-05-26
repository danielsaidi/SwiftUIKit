//
//  ListActionButton.swift
//  Vinylsamlaren
//
//  Created by Daniel Saidi on 2026-05-26.
//

import SwiftUI

/// This view can be used in a ``ListActionButtonGroup``.
@available(iOS 26.0, *)
public struct ListActionButton: View {

    public init(
        title: LocalizedStringResource,
        icon: Image,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.action = action
    }

    let title: LocalizedStringResource
    let icon: Image
    let action: () -> Void

    public var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                icon
                Text(title)
                    .font(.caption)
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
