//
//  ListSectionTitle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This view mimics the `Section` title od a grouped `List`.
///
/// This font uses `.headline` with a `.scaleEffect` in iOS 26 to allow for
/// dynamic type support.
///
/// This doesn't add insets by default, but you can set `withInsets` to `true`
/// to apply a standard padding.
public struct ListSectionTitle: View {

    public init(
        _ text: LocalizedStringKey,
        bundle: Bundle? = nil,
        withInsets: Bool = false
    ) {
        self.text = text
        self.bundle = bundle
        self.applyInsets = withInsets
    }

    private let text: LocalizedStringKey
    private let bundle: Bundle?
    private let applyInsets: Bool
    
    public var body: some View {
        if #available(iOS 26.0, *) {
            Text(text, bundle: bundle)
                .font(.headline)
                .foregroundColor(.secondary)
                .scaleEffect(0.98)
        } else {
            Text(text, bundle: bundle)
                .textCase(.uppercase)
                .foregroundColor(.secondary)
                .font(.footnote)
                .withGroupedListSectionHeaderInsets(if: applyInsets)
        }
    }
}

private extension View {
    
    @ViewBuilder
    func withGroupedListSectionHeaderInsets(
        if condition: Bool
    ) -> some View {
        if condition {
            self.padding(.leading)
                .padding(.top, -3)
        } else {
            self
        }
    }
}

#Preview {

    List {
        Section(header: Text("Preview.SectionTitle", bundle: .module)) {
            ListSectionTitle("Preview.SectionTitle", bundle: .module)
        }
    }
}
