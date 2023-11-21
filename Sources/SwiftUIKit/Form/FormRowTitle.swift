//
//  FormRowTitle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-11-01.
//  Copyright © 2022-2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view renders a standard form row title.
 
 You can apply it to any view with `.formRowTitle(...)`.
 */
public struct FormRowTitle: View {

    public init(
        _ title: String
    ) {
        self.title = title
    }

    private let title: String

    public var body: some View {
        Text(title)
            .lineLimit(1)
            .font(.footnote)
            .foregroundColor(.secondary)
    }
}

public extension View {
    
    /// Apply a ``FormRowTitle`` to the view.
    func formRowTitle(
        _ title: String,
        spacing: Double = 5
    ) -> some View {
        VStack(alignment: .leading, spacing: spacing) {
            FormRowTitle(title)
            self
        }
    }
}
