//
//  ListSubtitle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-02-04.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "Use LabeledContent instead.")
public struct ListSubtitle: View {

    public init(
        _ text: LocalizedStringKey,
        bundle: Bundle? = nil
    ) {
        self.text = text
        self.bundle = bundle
    }
    
    private let text: LocalizedStringKey
    private let bundle: Bundle?
    
    public var body: some View {
        Text(text, bundle: bundle)
            .font(.footnote)
            .foregroundColor(.secondary)
            .lineLimit(1)
    }
}
