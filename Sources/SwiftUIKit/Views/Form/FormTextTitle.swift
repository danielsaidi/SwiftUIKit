//
//  FormTextTitle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-11-01.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct FormTextTitle: View {

    init(_ title: String) {
        self.title = title
    }

    private let title: String

    var body: some View {
        Text(title)
            .lineLimit(1)
            .font(.footnote)
            .foregroundColor(.secondary)
    }
}
